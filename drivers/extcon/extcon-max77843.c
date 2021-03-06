/*
 * max77843-muic.c - MUIC driver for the Maxim 77843
 *
 *  Copyright (C) 2012 Samsung Electronics.
 *  <sukdong.kim@samsung.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/i2c.h>
#include <linux/gpio.h>
#include <linux/slab.h>
#include <linux/interrupt.h>
#include <linux/err.h>
#include <linux/platform_device.h>
#include <linux/workqueue.h>
#include <linux/input.h>
#include <linux/mfd/max77843.h>
#include <linux/mfd/max77843-private.h>
//#include <linux/host_notify.h>
#include <linux/wakelock.h>
#include <linux/switch.h>
#if defined(CONFIG_USBHUB_USB3803)
#include <linux/usb3803.h>
#endif
#include <linux/delay.h>
#include <linux/extcon.h>

#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
#include <linux/usb_notify.h>
#endif

#define DEV_NAME	"max77843-muic"
#define POLLING_TIME	1000
#define	ESCAPE_COUNTER	10

/* for lpm mode check */
extern int poweroff_charging;

extern int system_rev;

extern struct otg_notify *get_otg_notify(void);

#if defined(CONFIG_CHARGER_SMB1357)
extern void smb1357_charger_external_apsd(u8 enable);
#endif

/* for providing API */
static struct max77843_muic_info *gInfo;

/* MAX77843 MUIC CHG_TYP setting values */
enum {
	/* No Valid voltage at VB (Vvb < Vvbdet) */
	CHGTYP_NO_VOLTAGE	= 0x00,
	/* Unknown (D+/D- does not present a valid USB charger signature) */
	CHGTYP_USB		= 0x01,
	/* Charging Downstream Port */
	CHGTYP_DOWNSTREAM_PORT	= 0x02,
	/* Dedicated Charger (D+/D- shorted) */
	CHGTYP_DEDICATED_CHGR	= 0x03,
	/* Special 500mA charger, max current 500mA */
	CHGTYP_500MA		= 0x04,
	/* Special 1A charger, max current 1A */
	CHGTYP_1A		= 0x05,
	/* Reserved for Future Use */
	CHGTYP_RFU		= 0x06,
	/* Dead Battery Charging, max current 100mA */
	CHGTYP_DB_100MA		= 0x07,
	CHGTYP_MAX,

	CHGTYP_INIT,
	CHGTYP_MIN = CHGTYP_NO_VOLTAGE
};

#define CHGTYP (CHGTYP_USB | CHGTYP_DOWNSTREAM_PORT |\
CHGTYP_DEDICATED_CHGR | CHGTYP_500MA | CHGTYP_1A |CHGTYP_RFU)

enum {
	ADC_GND			= 0x00,
	ADC_MHL			= 0x01,
	ADC_VZW_USB_DOCK	= 0x0e, /* 0x01110 28.7K ohm VZW Dock */
	ADC_INCOMPATIBLE	= 0x0f, /* 0x01111 34K ohm */
	ADC_SMARTDOCK		= 0x10, /* 0x10000 40.2K ohm */
	ADC_HMT			= 0x11, /* 0x10001 49.9K ohm */
	ADC_AUDIODOCK		= 0x12, /* 0x10010 64.9K ohm */
	ADC_LANHUB		= 0x13, /* 0x10011 80.07K ohm */
	ADC_CHARGING_CABLE	= 0x14, /* 0x10100 102K ohm */
	ADC_MULTIMEDIADOCK	= 0x15, /* 0x10101 121K ohm */
	ADC_CEA936ATYPE1_CHG	= 0x17,	/* 0x10111 200K ohm */
	ADC_JIG_USB_OFF		= 0x18, /* 0x11000 255K ohm */
	ADC_JIG_USB_ON		= 0x19, /* 0x11001 301K ohm */
	ADC_DESKDOCK		= 0x1a, /* 0x11010 365K ohm */
	ADC_CEA936ATYPE2_CHG	= 0x1b, /* 0x11011 442K ohm */
	ADC_JIG_UART_OFF	= 0x1c, /* 0x11100 523K ohm */
	ADC_JIG_UART_ON		= 0x1d, /* 0x11101 619K ohm */
	ADC_OPEN		= 0x1f
};

struct max77843_muic_info {
	struct device		*dev;
	struct max77843_dev	*max77843;
	struct i2c_client	*muic;
	struct max77843_muic_data *muic_data;
	struct extcon_dev	*edev;
	int			irq_adc;
	int			irq_vbvolt;
	int			irq_chgtype;
	int			irq_vdnmon;
	int			irq_mrxrdy;
	int			irq_vbadc;
	int			mansw;
	int			path;
	int			otg_test;
	bool			uart_en;
	u8			adc_mode;

#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	int			irq_mpnack;
	u8			qc_hv_mode;
#endif
	u8			tx_data;
	bool			is_check_hv;
	bool			afc_disable;

	struct wake_lock muic_wake_lock;

	enum extcon_cable_name	cable_name;
	struct delayed_work	init_work;
	struct delayed_work	afc_err_detect_work;
	struct mutex		mutex;
#if !defined(CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK)
	bool			is_factory_start;
#endif /* !CONFIG_MUIC_MAX77843_SUPORT_CAR_DOCK */

	u8		adc;
	u8		chgtyp;
	u8		vbvolt;
	bool			is_adc_open_prev;
#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
	/* USB Notifier */
	struct notifier_block	usb_nb;
#endif
};
static const char const *max77843_path_name[] = {
	[MAX77843_PATH_OPEN]	= "OPEN",
	[MAX77843_PATH_USB_AP]	= "USB-AP",
	[MAX77843_PATH_AUDIO]	= "AUDIO",
	[MAX77843_PATH_UART_AP]	= "UART-AP",
	[MAX77843_PATH_USB_AUX]	= "USB-AUX",
	[MAX77843_PATH_UART_AUX]= "UART-AUX",
	NULL,
};

static struct switch_dev switch_uart3 = {
	.name = "uart3",	/* /sys/class/switch/uart3/state */
};

static int if_muic_info;
static int switch_sel;
static int if_pmic_rev;

static void _detected(struct max77843_muic_info *info, u32 new_state);

void max77843_update_jig_state(struct max77843_muic_info *info);
/* func : get_if_pmic_inifo
 * switch_sel value get from bootloader comand line
 * switch_sel data consist 8 bits (xxxxzzzz)
 * first 4bits(zzzz) mean path infomation.
 * next 4bits(xxxx) mean if pmic version info
 */
#ifdef CONFIG_OF_SUBCMDLINE_PARSE
static int get_if_pmic_info(void)
{
	int ret;
	char str[20], *buf, data;

	ret = of_parse_args_on_subcmdline("pmic_info=",(char *)str);
	if (ret) {
		pr_err("%s: pmic read error\n", __func__);
		return -1;
	}

	buf = str;
	strcpy(&data, &buf[0]);
	sscanf(&data, "%d", (unsigned int *)&if_muic_info);

	switch_sel = if_muic_info & 0xf0f;
	if_pmic_rev = (if_muic_info & 0xf0) >> 4;
	pr_info("%s %s: switch_sel: %x if_pmic_rev:%x\n",
		__FILE__, __func__, switch_sel, if_pmic_rev);
	
	return 0;
}
#else
static int get_if_pmic_inifo(char *str)
{
	get_option(&str, &if_muic_info);
	switch_sel = if_muic_info & 0xf0f;
	if_pmic_rev = (if_muic_info & 0xf0) >> 4;
	pr_info("%s %s: switch_sel: %x if_pmic_rev:%x\n",
		__FILE__, __func__, switch_sel, if_pmic_rev);
	return if_muic_info;
}
__setup("pmic_info=", get_if_pmic_inifo);
#endif

static int max77843_muic_set_comp2_comn1_pass2
	(struct max77843_muic_info *info, int type, int path)
{
	/* type 0 == usb, type 1 == uart */
	u8 cntl1_val, cntl1_msk;
	int ret = 0;
	int val;

	dev_info(info->dev, "func: %s type: %d path: %d\n",
		__func__, type, path);
	if (type == 0) {
		if (path == MAX77843_PATH_USB_AP) {
			info->muic_data->usb_sel = MAX77843_PATH_USB_AP;
			val = MAX77843_MUIC_CTRL1_BIN_1_001;
		} else if (path == MAX77843_PATH_USB_AUX) {
			info->muic_data->usb_sel = MAX77843_PATH_USB_AUX;
			val = MAX77843_MUIC_CTRL1_BIN_4_100;
		} else {
			dev_err(info->dev, "func: %s invalid usb path\n"
				, __func__);
			return -EINVAL;
		}
	} else if (type == 1) {
		if (path == MAX77843_PATH_UART_AP) {
			info->muic_data->uart_sel = MAX77843_PATH_UART_AP;
			val = MAX77843_MUIC_CTRL1_BIN_3_011;
		} else if (path == MAX77843_PATH_UART_AUX) {
			info->muic_data->uart_sel = MAX77843_PATH_UART_AUX;
			val = MAX77843_MUIC_CTRL1_BIN_5_101;
		} else {
			dev_err(info->dev, "func: %s invalid uart path\n"
				, __func__);
			return -EINVAL;
		}
	}
	else {
		dev_err(info->dev, "func: %s invalid path type(%d)\n"
			, __func__, type);
		return -EINVAL;
	}

	cntl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
	cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;

	max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL1, cntl1_val,
			    cntl1_msk);

	return ret;
}

static int max77843_muic_set_uart_sel_pass2
	(struct max77843_muic_info *info, int path)
{
	int ret = 0;
	ret = max77843_muic_set_comp2_comn1_pass2(info, 1/*uart*/, path);
	return ret;

}

static ssize_t max77843_muic_show_usb_state(struct device *dev,
					    struct device_attribute *attr,
					    char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	dev_info(info->dev, "func:%s info->cable_name:[%s]\n",
		 __func__, extcon_cable_name[info->cable_name]);
	switch (info->cable_name) {
	case EXTCON_USB:
	case EXTCON_CHARGE_DOWNSTREAM:
	case EXTCON_JIG_USBOFF:
	case EXTCON_JIG_USBON:
		return sprintf(buf, "USB_STATE_CONFIGURED\n");
	default:
		break;
	}

	return sprintf(buf, "USB_STATE_NOTCONFIGURED\n");
}

static ssize_t max77843_muic_show_device(struct device *dev,
					 struct device_attribute *attr,
					 char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	dev_info(info->dev, "func:%s info->cable_name:[%s]\n",
		 __func__, extcon_cable_name[info->cable_name]);

	switch (info->cable_name) {
	case EXTCON_NONE:
		return sprintf(buf, "No cable\n");
	case EXTCON_USB:
		return sprintf(buf, "USB\n");
	case EXTCON_CHARGE_DOWNSTREAM:
		return sprintf(buf, "Charge Downstream Port\n");
	case EXTCON_USB_HOST:
		return sprintf(buf, "OTG\n");
	case EXTCON_TA:
		return sprintf(buf, "TA\n");
	case EXTCON_HV_PREPARE:
		return sprintf(buf, "HV Prepare\n");
	case EXTCON_HV_TA:
		return sprintf(buf, "HV TA\n");
	case EXTCON_HV_TA_ERR:
		return sprintf(buf, "Error HV TA\n");
	case EXTCON_DESKDOCK:
		return sprintf(buf, "Desk Dock\n");
	case EXTCON_DESKDOCK_VB:
		return sprintf(buf, "Desk Dock with TA\n");
	case EXTCON_SMARTDOCK:
		return sprintf(buf, "Smart Dock\n");
	case EXTCON_SMARTDOCK_TA:
		return sprintf(buf, "Smart Dock with TA\n");
	case EXTCON_SMARTDOCK_USB:
		return sprintf(buf, "Smart Dock with USB\n");
	case EXTCON_MULTIMEDIADOCK:
		return sprintf(buf, "Multimedia Dock\n");
	case EXTCON_AUDIODOCK:
		return sprintf(buf, "Audio Dock\n");
	case EXTCON_JIG_UARTOFF:
		return sprintf(buf, "JIG UART OFF\n");
	case EXTCON_JIG_UARTOFF_VB:
		return sprintf(buf, "JIG UART OFF/VB\n");
	case EXTCON_JIG_UARTON:
		return sprintf(buf, "JIG UART ON\n");
	case EXTCON_JIG_USBOFF:
		return sprintf(buf, "JIG USB OFF\n");
	case EXTCON_JIG_USBON:
		return sprintf(buf, "JIG USB ON\n");
	case EXTCON_MHL:
		return sprintf(buf, "mHL\n");
	case EXTCON_MHL_VB:
		return sprintf(buf, "mHL charging\n");
	case EXTCON_INCOMPATIBLE:
		return sprintf(buf, "Incompatible TA\n");
	case EXTCON_CHARGING_CABLE:
		return sprintf(buf, "Charging Cable\n");
	default:
		break;
	}

	return sprintf(buf, "UNKNOWN\n");
}

static ssize_t max77843_muic_show_manualsw(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "func:%s usb_sel:%d\n",
		 __func__, info->muic_data->usb_sel);/*For debuging*/

	switch (info->muic_data->usb_sel) {
	case MAX77843_PATH_USB_AP:
		return sprintf(buf, "PDA\n");
	case MAX77843_PATH_USB_AUX:
		return sprintf(buf, "MODEM\n");
	case MAX77843_PATH_AUDIO:
		return sprintf(buf, "Audio\n");
	default:
		break;
	}

	return sprintf(buf, "UNKNOWN\n");
}

static int max77843_muic_set_usb_path(struct max77843_muic_info *info,
					int path);
static ssize_t max77843_muic_set_manualsw(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "func:%s buf:%s,count:%d\n", __func__, buf, count);

	if (!strncasecmp(buf, "PDA", 3)) {
		info->muic_data->usb_sel = MAX77843_PATH_USB_AP;
		dev_info(info->dev, "%s: PATH_USB_AP\n", __func__);
	} else if (!strncasecmp(buf, "MODEM", 5)) {
		info->muic_data->usb_sel = MAX77843_PATH_USB_AUX;
		dev_info(info->dev, "%s: PATH_USB_AUX\n", __func__);
		max77843_muic_set_usb_path(info, MAX77843_PATH_USB_AUX);
	} else
		dev_warn(info->dev, "%s: Wrong command\n", __func__);

	return count;
}

static ssize_t max77843_muic_show_adc(struct device *dev,
				      struct device_attribute *attr, char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS1, &val);
	dev_info(info->dev, "func:%s ret:%d val:%x\n", __func__, ret, val);

	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg\n", __func__);
		return sprintf(buf, "UNKNOWN\n");
	}

	return sprintf(buf, "%x\n", (val & MAX77843_STATUS1_ADC_MASK));
}

static ssize_t max77843_muic_show_audio_path(struct device *dev,
					     struct device_attribute *attr,
					     char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_CTRL1, &val);
	dev_info(info->dev, "func:%s ret:%d val:%x\n", __func__, ret, val);
	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg\n", __func__);
		return sprintf(buf, "UNKNOWN\n");
	}

	return sprintf(buf, "%x\n", val);
}

static ssize_t max77843_muic_set_audio_path(struct device *dev,
					    struct device_attribute *attr,
					    const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	struct i2c_client *client = info->muic;
	u8 cntl1_val, cntl1_msk;
	u8 val;
	dev_info(info->dev, "func:%s buf:%s\n", __func__, buf);
	if (!strncmp(buf, "0", 1))
		val = MAX77843_MUIC_CTRL1_BIN_0_000;
	else if (!strncmp(buf, "1", 1))
		val = MAX77843_MUIC_CTRL1_BIN_2_010;
	else {
		dev_warn(info->dev, "%s: Wrong command\n", __func__);
		return count;
	}

	cntl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
	cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;

	max77843_update_reg(client, MAX77843_MUIC_REG_CTRL1, cntl1_val,
			    cntl1_msk);
	dev_info(info->dev, "MUIC cntl1_val:%x, cntl1_msk:%x\n", cntl1_val,
		 cntl1_msk);

	cntl1_val = MAX77843_MUIC_CTRL1_BIN_0_000;
	max77843_read_reg(client, MAX77843_MUIC_REG_CTRL1, &cntl1_val);
	dev_info(info->dev, "%s: CNTL1(0x%02x)\n", __func__, cntl1_val);

	return count;
}

static ssize_t max77843_muic_show_otg_test(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_CDETCTRL1, &val);
	dev_info(info->dev, "func:%s ret:%d val:%x buf%s\n",
		 __func__, ret, val, buf);
	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg\n", __func__);
		return sprintf(buf, "UNKNOWN\n");
	}
	val &= MAX77843_CDETCTRL1_CHGDETEN_MASK;

	return sprintf(buf, "%x\n", val);
}

static ssize_t max77843_muic_set_otg_test(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	struct i2c_client *client = info->muic;
	u8 val;

	dev_info(info->dev, "func:%s buf:%s\n", __func__, buf);
	if (!strncmp(buf, "0", 1))
		val = 0;
	else if (!strncmp(buf, "1", 1))
		val = 1;
	else {
		dev_warn(info->dev, "%s: Wrong command\n", __func__);
		return count;
	}

	info->otg_test = (val ? false : true);

	max77843_update_reg(client, MAX77843_MUIC_REG_CDETCTRL1,
		    val << MAX77843_CDETCTRL1_CHGDETEN_SHIFT, MAX77843_CDETCTRL1_CHGDETEN_MASK);

	val = 0;
	max77843_read_reg(client, MAX77843_MUIC_REG_CDETCTRL1, &val);
	dev_info(info->dev, "%s: CDETCTRL(0x%02x)\n", __func__, val);

	return count;
}

void max77843_muic_set_chgdeten(int enable)
{
	struct max77843_muic_info *info = gInfo;
	struct i2c_client *client = info->muic;

	u8 val = 0;

	if (enable) {
		val = 1;
	} else {
		val = 0;
	}

	max77843_update_reg(client, MAX77843_MUIC_REG_CDETCTRL1,
		val << MAX77843_CDETCTRL1_CHGDETEN_SHIFT, MAX77843_CDETCTRL1_CHGDETEN_MASK);

	val = 0;
	max77843_read_reg(client, MAX77843_MUIC_REG_CDETCTRL1, &val);
	dev_info(info->dev, "%s: CDETCTRL(0x%02x)\n", __func__, val);
}

#if defined(CONFIG_ADC_ONESHOT)
static int max77843_muic_set_adcmode(struct max77843_muic_info *info,
					int value)
{
	int ret;
	u8 val;

	if (info->adc_mode == value) {
		pr_info("%s: same value:%02x\n", __func__, value);
		return 1;
	}
	dev_info(info->dev, "%s: value:%02x\n", __func__, value);
	if(!info->muic) {
		dev_err(info->dev, "%s: no muic i2c client\n", __func__);
		return -EINVAL;
	}

	val = value << MAX77843_CTRL4_ADCMODE_SHIFT;
	dev_info(info->dev, "ADC MODE(0x%02x)\n", val);
	ret = max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL4, val,
				MAX77843_CTRL4_ADCMODE_MASK);
	if(ret < 0) {
		dev_err(info->dev, "%s: fail to update reg\n", __func__);
		return -EINVAL;
	}
	info->adc_mode = value;
	return 0;
}
#endif

static void max77843_muic_afc_err_detect(struct work_struct *work)
{
	struct max77843_muic_info *info =
	    container_of(work, struct max77843_muic_info, afc_err_detect_work.work);
	u32 new_state=0;
	u8 status3;
	u8 hvctrl1;
	int ret;

	if(gInfo->cable_name != EXTCON_HV_PREPARE)
		return;
	
	switch(info->qc_hv_mode) {
	case MAX77843_MVBUS_QC_9V:
		hvctrl1 = 0x3d;
		break;
	case MAX77843_MVBUS_QC_12V:
		hvctrl1 = 0x35;
		break;
	case MAX77843_MVBUS_QC_20V:
		hvctrl1 = 0x3f;
		break;
	default:
		hvctrl1 = 0x33;
		break;
	}
	dev_info(info->dev, "%s: set Voltage value 0x%x.\n", __func__, hvctrl1);
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_HVCTRL1, hvctrl1);
	
	/* Wait for voltage rising */
	mdelay(300);

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);
	if(IS_ERR_VALUE(ret))
	{
		dev_err(info->dev, "%s: cannot read STATUS3: %d\n", __func__, ret);
		return;
	}

	if(((status3 & 0x0F) >= MAX77843_MVBUS_8V_9V) && ((status3 & 0x0F) <= MAX77843_MVBUS_9V_10V))
	{
		dev_info(info->dev, "%s: VbADC is right QC 2.0 value.\n", __func__);
		new_state = BIT(EXTCON_HV_TA);
		gInfo->cable_name = EXTCON_HV_TA;
	} else if(((status3 & 0x0F) >= MAX77843_MVBUS_4V_5V) && ((status3 & 0x0F) <= MAX77843_MVBUS_5V_6V)) {
		dev_info(info->dev, "%s: VbADC is in normal voltage value.(adc=0x%x)\n", __func__, (status3&0x0F));
		max77843_write_reg(info->muic, MAX77843_MUIC_REG_HVCTRL1, 0x33);
		new_state = BIT(EXTCON_TA);
		gInfo->cable_name = EXTCON_TA;
	} else {
		dev_info(info->dev, "%s: VbADC is out of QC 2.0 range value.(%x)\n", __func__, (status3&0x0F));
#if defined(CONFIG_ADC_ONESHOT)
		max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
		return;
	}

#if defined(CONFIG_ADC_ONESHOT)
	max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
	_detected(info, new_state);
	max77843_update_jig_state(info);
	return;
}

static bool is_muic_check_hv(struct max77843_muic_info *info)
{
	return (info->is_check_hv ? true : false);
}

static void max77843_muic_set_check_hv(struct max77843_muic_info *info, bool value)
{
	pr_info("%s: mdata->is_check_hv = [%c]->[%c]\n", __func__, 
			(info->is_check_hv ? 'T' : 'F'), 
			(value ? 'T' : 'F'));

	info->is_check_hv = value;
}

static void max77843_muic_start_check_hv(struct max77843_muic_info *info)
{
	struct i2c_client *client = info->muic;

	pr_info("%s\n", __func__);
	/* set HVCONTROL1 = 0x11 
	 * 0x11 = DPVD_D06 | DPDNVDEN
	 */
#if defined(CONFIG_CHARGER_SMB1357)
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL1, 0x10);
#else
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL1, 0x11);
#endif

	/* Set VbusADCEn = 1 */
	max77843_update_reg(client, MAX77843_MUIC_REG_HVCTRL1,
			(1 << MAX77843_HVCTRL1_VBUSADCEN_SHIFT), MAX77843_HVCTRL1_VBUSADCEN_MASK);

	max77843_muic_set_check_hv(info, true);

	/* set INTMASK3 = 0x02 
	 * 0x02 = VDNMONM
	 */
#if defined(CONFIG_CHARGER_SMB1357)
	msleep(60);
	max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x01);
#else
	max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x02);
#endif

	return;
}

static void max77843_muic_set_hv(struct max77843_muic_info *info)
{
	struct i2c_client *client = info->muic;
	u8 value;
	u8 hvctrl1;
	u8 status3;
	int ret;

	dev_info(info->dev, "%s: HV charger is detected.\n", __func__);

	/* Read DPDNVdEn bit for check HV Status */
	max77843_read_reg(info->muic, MAX77843_MUIC_REG_HVCTRL1, &hvctrl1);

	if ((hvctrl1 & 0x01) == 1) {
		max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);
		if ((status3 & 0x10) != 0)
			return;
		else
			pr_info("%s:Valid HV Charger detection\n", __func__);
	} else {
		return;
	}
#if defined(CONFIG_ADC_ONESHOT)
	/* Set ADC ALWAYS Mode for checking High Voltage Charger */
	max77843_muic_set_adcmode(info, MAX77843_ADC_ALWAYS);
#endif

	/* Set values about HV Charging 
	 *  HVCTRL1 = 0x20
	 *  HVCTRL2 = 0x06
	 */
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL1, 0x20);
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x06);

	/* Set INTMASK3 = 0x00 */
	max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x00);

	/* Set TX Data */
	dev_info(info->dev, "%s: Write TX DATA 0x%x\n", __func__, gInfo->tx_data);
	value = gInfo->tx_data;
	max77843_write_reg(client, MAX77843_MUIC_REG_HVTXBYTE, value);

	/* Set HVCTRL2 = 0x1B */
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x1B);
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	/* Set INTMASK3 = 0x88 for MRxRdy / MPNack */
	ret = max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x88);
#else
	/* Set INTMASK3 = 0x80 for MRxRdy */
	ret = max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x80);
#endif
	if (IS_ERR_VALUE(ret))
		pr_err("%s: Can't write INTMASK3 : %d\n", __func__, ret);

	/* WA for MPing Fail case(Not exist ACK/NACK) */
	schedule_delayed_work(&info->afc_err_detect_work, msecs_to_jiffies(2000));

	/* Send prepare for boost the voltage */
	pr_info("%s: Send HV_PREPARE\n", __func__);
	gInfo->cable_name = EXTCON_HV_PREPARE;
	_detected(info, BIT(EXTCON_HV_PREPARE));
	return;
}

#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
static void max77843_muic_check_qc_hv(struct max77843_muic_info *info)
{
	u32 new_state=0;
	u8 status3;
	u8 hvctrl1;
	int ret;

	dev_info(info->dev, "%s: QC 2.0 charger is detected.\n", __func__);

	cancel_delayed_work(&info->afc_err_detect_work);
	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);
	if(IS_ERR_VALUE(ret))
	{
		dev_err(info->dev, "%s: cannot read STATUS3: %d\n", __func__, ret);
		return;
	}
	
	/* QC 2.0 charger check
	 * MPNack(status3 & 0x40) == 1 : QC2.0 charger
	 */
	if (!(status3 & 0x40)) {
		dev_info(info->dev, "%s: MPNACK is not set(0x%x).\n", __func__, status3);
		return;
	}

	if ((status3 & 0x10)) {
		dev_info(info->dev, "%s: VDNMON is not set(0x%x).\n", __func__, status3);
		return;
	}
	
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_HVCTRL2, 0x03);

	switch(info->qc_hv_mode) {
	case MAX77843_MVBUS_QC_9V:
		hvctrl1 = 0x3d;
		break;
	case MAX77843_MVBUS_QC_12V:
		hvctrl1 = 0x35;
		break;
	case MAX77843_MVBUS_QC_20V:
		hvctrl1 = 0x3f;
		break;
	default:
		hvctrl1 = 0x33;
		break;
	}
	dev_info(info->dev, "%s: set Voltage value 0x%x.\n", __func__, hvctrl1);
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_HVCTRL1, hvctrl1);

	/* Wait for voltage rising */
	mdelay(300);

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);
	if(IS_ERR_VALUE(ret))
	{
		dev_err(info->dev, "%s: cannot read STATUS3: %d\n", __func__, ret);
		return;
	}

	if(((status3 & 0x0F) >= MAX77843_MVBUS_8V_9V) && ((status3 & 0x0F) <= MAX77843_MVBUS_9V_10V))
	{
		dev_info(info->dev, "%s: VbADC is right QC 2.0 value.\n", __func__);
		new_state = BIT(EXTCON_HV_TA);
		gInfo->cable_name = EXTCON_HV_TA;
	} else if(((status3 & 0x0F) >= MAX77843_MVBUS_4V_5V) && ((status3 & 0x0F) <= MAX77843_MVBUS_5V_6V)) {
		dev_info(info->dev, "%s: VbADC is in normal voltage value.(adc=0x%x)\n", __func__, (status3&0x0F));
		max77843_write_reg(info->muic, MAX77843_MUIC_REG_HVCTRL1, 0x33);
		new_state = BIT(EXTCON_TA);
		gInfo->cable_name = EXTCON_TA;
	} else {
		dev_info(info->dev, "%s: VbADC is out of QC 2.0 range value.(%x)\n", __func__, (status3&0x0F));
#if defined(CONFIG_ADC_ONESHOT)
		max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
		return;
	}

#if defined(CONFIG_ADC_ONESHOT)
	max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
	_detected(info, new_state);
	max77843_update_jig_state(info);
	return;
}
#endif

static void max77843_muic_check_handshaking(struct max77843_muic_info *info)
{
	struct i2c_client *client = info->muic;
	u32 new_state=0;
	u8 hvtxbyte;
	u8 hvrxbyte[16];
	u8 selecthvtxbyte = 0;
	int i, ret;
	u8 value;
	u8 vbadc;

	cancel_delayed_work(&info->afc_err_detect_work);
	if (info->cable_name == EXTCON_HV_TA_1A){
		dev_info(info->dev, "%s: Already Undifined cable is attached. end here\n", __func__);
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x00);
		max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x03);
		new_state = BIT(EXTCON_HV_TA_1A);
		gInfo->cable_name = EXTCON_HV_TA_1A;
		goto __found_cable;
	}

	max77843_read_reg(client, MAX77843_MUIC_REG_HVTXBYTE, &hvtxbyte);

	ret = max77843_bulk_read(client, MAX77843_MUIC_REG_HVRXBYTE1, 16, hvrxbyte);
	if(ret) {
		dev_err(info->dev, "%s: fail to read muic reg(%d)\n", __func__, ret);
		return;
	}

	pr_info("%s:TXBYTE:0x%x, RXBYTE[0]:0x%x\n", __func__, hvtxbyte, hvrxbyte[0]);
	if(hvrxbyte[0] != hvtxbyte)
	{
		for (i=0;hvrxbyte[i]!=0 && i<16; i++)
		{
			pr_info("%s:RXBYTE[%d]:0x%x\n", __func__, i, hvrxbyte[i]);
			if(((hvrxbyte[i] & 0xF0) == 0x40) && (hvtxbyte > selecthvtxbyte))
				selecthvtxbyte = hvrxbyte[i];
		}

		if (selecthvtxbyte != 0)
			max77843_write_reg(client, MAX77843_MUIC_REG_HVTXBYTE, selecthvtxbyte);
		else {
			new_state = BIT(EXTCON_TA);
			gInfo->cable_name = EXTCON_TA;
			goto __found_cable;
		}
	}

	/* Set HVCTRL2 = 0x5B
	 * 0x1B = MPngEnb | MTxEn | MPing | DP06En | HVDIGEn
	 */
	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x5B);

	msleep_interruptible(400);

	/* Read VbADC in STATUS3 reg */
	ret = max77843_read_reg(client, MAX77843_MUIC_REG_STATUS3, &value);
	if(IS_ERR_VALUE(ret))
	{
		dev_err(info->dev, "%s: cannot read STATUS3: %d\n", __func__, ret);
		return;
	}

	/* Check VBUS voltage
	 * STATUS3_VBADC_MASK : 0x0F 
	 */
	vbadc = value & 0x0F;

	switch(vbadc) {
	case MAX77843_MVBUS_8V_9V:
	case MAX77843_MVBUS_9V_10V:
		pr_info("%s: VbADC is right voltage value.\n", __func__);
		new_state = BIT(EXTCON_HV_TA);
		gInfo->cable_name = EXTCON_HV_TA;
		/* Set INTMASK3 = 0x00 */
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x00);
		max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x03);
		max77843_muic_set_check_hv(info, false);
		break;
	case MAX77843_MVBUS_4V_5V:
	case MAX77843_MVBUS_5V_6V:
		pr_info("%s: VbADC is in normal voltage value.(adc=0x%x)\n", __func__, vbadc);
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x00);
		max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x03);
		new_state = BIT(EXTCON_TA);
		gInfo->cable_name = EXTCON_TA;
		break;
	case MAX77843_MVBUS_6V_7V:
	case MAX77843_MVBUS_7V_8V:
	case MAX77843_MVBUS_10V_11V:
	case MAX77843_MVBUS_11V_12V:
	case MAX77843_MVBUS_12V_13V:
	case MAX77843_MVBUS_13V_14V:
	case MAX77843_MVBUS_14V_15V:
	case MAX77843_MVBUS_15V_16V:
	case MAX77843_MVBUS_16V_17V:
	case MAX77843_MVBUS_17V_18V:
	case MAX77843_MVBUS_18V_19V:
	case MAX77843_MVBUS_19V:
		pr_info("%s: VbADC is in error voltage value.(adc=0x%x)\n", __func__, vbadc);
		new_state = BIT(EXTCON_HV_TA_ERR);
		gInfo->cable_name = EXTCON_HV_TA_ERR;
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3, 0x00);
		max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL2, 0x03);
		break;
	default:
		pr_info("%s: VbADC is out range of HV voltage value.(%x)\n", __func__, vbadc);
#if defined(CONFIG_ADC_ONESHOT)
		max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
		return;
	}

__found_cable:
#if defined(CONFIG_ADC_ONESHOT)
	max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
#endif
	_detected(info, new_state);
	max77843_update_jig_state(info);
}

static void max77843_muic_check_vbus_input(struct max77843_muic_info *info)
{
#if defined(CONFIG_CHARGER_SMB1357)
	struct i2c_client *client = info->muic;
	u8 status3;
	u32 new_state = EXTCON_NONE;

	dev_info(info->dev, "%s. cable %d\n", __func__, info->cable_name);

	cancel_delayed_work(&info->afc_err_detect_work);
	if (info->cable_name == EXTCON_NONE) {
		/* Set INTMASK3 = 0x00 */
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3,0x00);

		dev_info(info->dev, "%s cable[%d].\n", __func__, info->cable_name);
		goto out;
	}

	max77843_write_reg(client, MAX77843_MUIC_REG_HVCTRL1, 0x20);
	msleep(60);

	/* Read STATUS3 for check VBADC */
	max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);

	if(((status3 & 0x0F) >= MAX77843_MVBUS_7V_8V) &&
		((status3 & 0x0F) <= MAX77843_MVBUS_9V_10V)) {
		/* Set INTMASK3 = 0x00 */
		max77843_write_reg(client, MAX77843_MUIC_REG_INTMASK3,0x00);
		max77843_muic_set_check_hv(info, false);

		pr_info("%s: HV TA.\n", __func__);
		new_state = BIT(EXTCON_HV_TA);
		gInfo->cable_name = EXTCON_HV_TA;

		_detected(info, new_state);
		max77843_update_jig_state(info);
	}
	else {
		pr_info("%s: Invalid VBADC range, TA. s3=[0x%x]\n",
			__func__, status3);
	}

out:
#endif
	return;
}

static u8 max77843_muic_delay_for_vdnmon(struct max77843_muic_info *info)
{
	int ret;
	u8 status3;
	u8 vdnmon;

	pr_info("%s: for init_detect\n", __func__);

	mdelay(30);

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS3, &status3);
	if (ret) {
		pr_err("%s: fail to read muic reg(%d)\n", __func__, ret);
		return -1;
	}

	vdnmon = (status3 & MAX77843_STATUS3_VDNMON_MASK);
	pr_info("%s: vdnmon rturn %02x\n", __func__, vdnmon);

	return vdnmon;
}

static void max77843_muic_set_adcdbset(struct max77843_muic_info *info,
				       int value)
{
	int ret;
	u8 val;
	dev_info(info->dev, "func:%s value:%x\n", __func__, value);
	if (value > 3) {
		dev_err(info->dev, "%s: invalid value(%x)\n", __func__, value);
		return;
	}

	if (!info->muic) {
		dev_err(info->dev, "%s: no muic i2c client\n", __func__);
		return;
	}

	val = value << MAX77843_CTRL4_ADCDBSET_SHIFT;
	dev_info(info->dev, "%s: ADCDBSET(0x%02x)\n", __func__, val);
	ret = max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL4, val,
				  MAX77843_CTRL4_ADCDBSET_MASK);
	if (ret < 0)
		dev_err(info->dev, "%s: fail to update reg\n", __func__);
}

static ssize_t max77843_muic_show_adc_debounce_time(struct device *dev,
			struct device_attribute *attr, char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;
	dev_info(info->dev, "func:%s buf:%s\n", __func__, buf);

	if (!info->muic)
		return sprintf(buf, "No I2C client\n");

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_CTRL4, &val);
	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg\n", __func__);
		return sprintf(buf, "UNKNOWN\n");
	}
	val &= MAX77843_CTRL4_ADCDBSET_MASK;
	val = val >> MAX77843_CTRL4_ADCDBSET_SHIFT;
	dev_info(info->dev, "func:%s val:%x\n", __func__, val);
	return sprintf(buf, "%x\n", val);
}

static ssize_t max77843_muic_set_afc_disable(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "%s, buf : %s\n", __func__, buf);

	if (!strncasecmp(buf, "0", 1))
		gInfo->afc_disable = false;
	else if (!strncasecmp(buf, "1", 1))
		gInfo->afc_disable = true;
	else
		dev_warn(info->dev, "%s: Wrong command\n", __func__);

	return count;
}

static ssize_t max77843_muic_show_afc_disable(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "%s: AFC is %s\n", __func__,
		((info->afc_disable)?"ENABLED":"DISABLED"));/*For debuging*/

	if(info->afc_disable)
		return sprintf(buf, "1\n");	/* Disabled */
	else
		return sprintf(buf, "0\n");	/* Enabled */
}

#if defined(CONFIG_MUIC_SUPPORT_RUSTPROOF)
static ssize_t max77843_muic_set_uart_en(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "%s, buf : %s\n", __func__, buf);

	if (!strncasecmp(buf, "0", 1))
		info->uart_en = false;
	else if (!strncasecmp(buf, "1", 1))
		info->uart_en = true;
	else
		dev_warn(info->dev, "%s: Wrong command\n", __func__);

	return count;
}

static ssize_t max77843_muic_show_uart_en(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "func: UART is %s %s\n", __func__,
		((info->uart_en)?"ENABLED":"DISABLED"));/*For debuging*/

	if(info->uart_en)
		return sprintf(buf, "1\n");	/* Enabled */
	else
		return sprintf(buf, "0\n");	/* Disabled */
}
#endif

static ssize_t max77843_muic_set_uart_sel(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "%s, buf : %s\n",__func__,buf);

	if (!strncasecmp(buf, "AP", 2)) {
		int ret = max77843_muic_set_uart_sel_pass2
			(info, MAX77843_PATH_UART_AP);
		if (ret >= 0){
			info->muic_data->uart_sel = MAX77843_PATH_UART_AP;
			dev_info(info->dev, "UART PATH:%d\n",
				info->muic_data->uart_sel);

		}else
			dev_err(info->dev, "%s: Change(AP) fail!!", __func__);
	} else if (!strncasecmp(buf, "CP2", 3)) {
		int ret = max77843_muic_set_uart_sel_pass2
			(info, MAX77843_PATH_UART_AUX);
		if (ret >= 0){
			info->muic_data->uart_sel = MAX77843_PATH_UART_AUX;
			dev_info(info->dev, "UART PATH:%d\n",
				info->muic_data->uart_sel);
		}else
			dev_err(info->dev, "%s: Change(AUX) fail!!", __func__);
	} else {
		dev_warn(info->dev, "%s: Wrong command\n", __func__);
	}
	return count;
}

static ssize_t max77843_muic_show_uart_sel(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);

	dev_info(info->dev, "func:%s usb_sel:%d\n",
	 __func__, info->muic_data->uart_sel);/*For debuging*/

	switch (info->muic_data->uart_sel) {
	case MAX77843_PATH_UART_AP:
		return sprintf(buf, "AP\n");
		break;
	case MAX77843_PATH_UART_AUX:
		return sprintf(buf, "CP2\n");
		break;
	default:
		break;
	}
	return sprintf(buf, "UNKNOWN\n");
}

static ssize_t max77843_muic_show_charger_type(struct device *dev,
					       struct device_attribute *attr,
					       char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	u8 adc, status;
	int ret;

	ret = max77843_read_reg(info->muic, MAX77843_MUIC_REG_STATUS1, &status);

	adc = status & MAX77843_STATUS1_ADC_MASK;

	/* SYSFS Node : chg_type
	*  SYSFS State
	*  0 : Dedicated Charger
	*  1 : Non-Dedicated Charger
	*  2 : Cigar Jack
	*/
	switch (adc){
	case ADC_MHL:
	case ADC_VZW_USB_DOCK:
	case ADC_SMARTDOCK:
	case ADC_AUDIODOCK:
	case ADC_DESKDOCK:
	case ADC_OPEN:
		dev_info(info->dev, "%s: Dedicated Charger State\n", __func__);
		return snprintf(buf, 4, "%d\n", 0);
		break;
	case ADC_CEA936ATYPE1_CHG:
	case ADC_INCOMPATIBLE:
		dev_info(info->dev, "%s: Undedicated Charger State\n", __func__);
		return snprintf(buf, 4, "%d\n", 1);
		break;
	case ADC_CEA936ATYPE2_CHG:
		dev_info(info->dev, "%s: Dedicated Charger State\n", __func__);
		return snprintf(buf, 4, "%d\n", 2);
		break;
	default:
		dev_info(info->dev, "%s: Undeclared State\n", __func__);
		break;
	}
	return snprintf(buf, 9, "%s\n", "UNKNOWN");
}

#if !defined(CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK)
static ssize_t max77843_muic_show_apo_factory(struct device *dev,
					   struct device_attribute *attr,
					   char *buf)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	const char *mode;

	/* true: Factory mode, false: not Factory mode */
	if (info->is_factory_start)
		mode = "FACTORY_MODE";
	else
		mode = "NOT_FACTORY_MODE";

	pr_info("%s:%s apo factory=%s\n", DEV_NAME, __func__, mode);

	return sprintf(buf, "%s\n", mode);
}

static ssize_t max77843_muic_set_apo_factory(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	const char *mode;

	pr_info("%s:%s buf:%s\n", DEV_NAME, __func__, buf);

	/* "FACTORY_START": factory mode */
	if (!strncmp(buf, "FACTORY_START", 13)) {
		info->is_factory_start = true;
		mode = "FACTORY_MODE";
	} else {
		pr_warn("%s:%s Wrong command\n", DEV_NAME, __func__);
		return count;
	}

	pr_info("%s:%s apo factory=%s\n", DEV_NAME, __func__, mode);

	return count;
}
#endif /* !CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK */

#if !defined(CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK)
static DEVICE_ATTR(apo_factory, 0664,
		max77843_muic_show_apo_factory,
		max77843_muic_set_apo_factory);
#endif /* !CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK */
static DEVICE_ATTR(chg_type, 0664, max77843_muic_show_charger_type, NULL);
static DEVICE_ATTR(uart_sel, 0664, max77843_muic_show_uart_sel,
		max77843_muic_set_uart_sel);
static DEVICE_ATTR(afc_disable, 0664, max77843_muic_show_afc_disable,
		max77843_muic_set_afc_disable);
#if defined(CONFIG_MUIC_SUPPORT_RUSTPROOF)
static DEVICE_ATTR(uart_en, 0664, max77843_muic_show_uart_en,
		max77843_muic_set_uart_en);
#endif
static DEVICE_ATTR(usb_state, S_IRUGO, max77843_muic_show_usb_state, NULL);
static DEVICE_ATTR(device, S_IRUGO, max77843_muic_show_device, NULL);
static DEVICE_ATTR(attached_dev, S_IRUGO, max77843_muic_show_device, NULL);
static DEVICE_ATTR(usb_sel, 0664,
		max77843_muic_show_manualsw, max77843_muic_set_manualsw);
static DEVICE_ATTR(adc, S_IRUGO, max77843_muic_show_adc, NULL);
static DEVICE_ATTR(audio_path, 0664,
		max77843_muic_show_audio_path, max77843_muic_set_audio_path);
static DEVICE_ATTR(otg_test, 0664,
		max77843_muic_show_otg_test, max77843_muic_set_otg_test);
static DEVICE_ATTR(adc_debounce_time, 0664,
		max77843_muic_show_adc_debounce_time,
		NULL);

static struct attribute *max77843_muic_attributes[] = {
	&dev_attr_uart_sel.attr,
#if defined(CONFIG_MUIC_SUPPORT_RUSTPROOF)
	&dev_attr_uart_en.attr,
#endif
	&dev_attr_afc_disable.attr,
	&dev_attr_usb_state.attr,
	&dev_attr_device.attr,
	&dev_attr_attached_dev.attr,
	&dev_attr_usb_sel.attr,
	&dev_attr_adc.attr,
	&dev_attr_audio_path.attr,
	&dev_attr_otg_test.attr,
	&dev_attr_adc_debounce_time.attr,
	&dev_attr_chg_type.attr,
#if !defined(CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK)
	&dev_attr_apo_factory.attr,
#endif /* !CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK */
	NULL
};

static void max77843_muic_uart_uevent(int state)
{
	if (switch_uart3.dev != NULL) {
		switch_set_state(&switch_uart3, state);
		dev_info(gInfo->dev, "%s: state:%d\n", __func__, state);
	}
}

static const struct attribute_group max77843_muic_group = {
	.attrs = max77843_muic_attributes,
};

static int max77843_muic_set_usb_path(struct max77843_muic_info *info, int path)
{
	struct i2c_client *client = info->muic;
	//int ret;
	u8 cntl1_val, cntl1_msk;
	int val;
	dev_info(info->dev, "func:%s path:%d, cable_name:%d\n", __func__, path, info->cable_name);
	
	switch (path) {
	case MAX77843_PATH_USB_AP:
		dev_info(info->dev, "%s: PATH_USB_AP\n", __func__);
		val = MAX77843_MUIC_CTRL1_BIN_1_001;
		cntl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
		cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;
		break;
	case MAX77843_PATH_AUDIO:
		dev_info(info->dev, "%s: PATH_AUDIO\n", __func__);
		/* SL1, SR2 */
		cntl1_val = (MAX77843_MUIC_CTRL1_BIN_2_010 << MAX77843_CTRL1_COMN1SW_SHIFT)
			| (MAX77843_MUIC_CTRL1_BIN_2_010 << MAX77843_CTRL1_COMP2SW_SHIFT);
		cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;
		break;
	case MAX77843_PATH_USB_AUX:
		dev_info(info->dev, "%s: PATH_USB_AUX\n", __func__);
		val = MAX77843_MUIC_CTRL1_BIN_4_100;
		cntl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
		cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;
		break;
	case MAX77843_PATH_OPEN:
		dev_info(info->dev, "%s: PATH_OPEN\n", __func__);
		val = MAX77843_MUIC_CTRL1_BIN_0_000;
		cntl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
		cntl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;
		break;
	default:
		dev_warn(info->dev, "%s: invalid path(%d)\n", __func__, path);
		return -EINVAL;
	}
	dev_info(info->dev, "%s: Set manual path\n", __func__);
	if (info->cable_name != EXTCON_DESKDOCK)
		max77843_update_reg(client, MAX77843_MUIC_REG_CTRL1, cntl1_val,
			    cntl1_msk);
	max77843_update_reg(client, MAX77843_MUIC_REG_CTRL2,
				MAX77843_CTRL2_CPEn1_LOWPWD0,
				MAX77843_CTRL2_CPEn_MASK | MAX77843_CTRL2_LOWPWD_MASK);

	cntl1_val = MAX77843_MUIC_CTRL1_BIN_0_000;
	max77843_read_reg(client, MAX77843_MUIC_REG_CTRL1, &cntl1_val);
	dev_info(info->dev, "%s: CNTL1(0x%02x)\n", __func__, cntl1_val);

	cntl1_val = MAX77843_MUIC_CTRL1_BIN_0_000;
	max77843_read_reg(client, MAX77843_MUIC_REG_CTRL2, &cntl1_val);
	dev_info(info->dev, "%s: CNTL2(0x%02x)\n", __func__, cntl1_val);

	sysfs_notify(&switch_dev->kobj, NULL, "usb_sel");
	return 0;
}

#if !defined(CONFIG_EXTCON_MAX77843)
int max77843_muic_get_charging_type(void)
{
	if (gInfo)
		return gInfo->cable_name;
	else
		return EXTCON_NONE;
}
#endif

static void max77843_muic_set_disable_chgdetrun(struct max77843_muic_info *info)
{
	pr_info("%s:Force disable for CHG_DET_RUN\n", __func__);
	max77843_update_reg(info->muic, MAX77843_MUIC_REG_CDETCTRL1,
			0x0 << MAX77843_CDETCTRL1_CHGDETEN_SHIFT,
			MAX77843_CDETCTRL1_CHGDETEN_MASK);
}

static void max77843_muic_set_enable_chgdetrun(struct max77843_muic_info *info)
{
	pr_info("%s:Force disable for CHG_DET_RUN\n", __func__);
	max77843_update_reg(info->muic, MAX77843_MUIC_REG_CDETCTRL1,
			0x1 << MAX77843_CDETCTRL1_CHGDETEN_SHIFT,
			MAX77843_CDETCTRL1_CHGDETEN_MASK);
}

#if defined(CONFIG_MUIC_SUPPORT_SMART_DOCK)
static void max77843_muic_set_dpdm_force_switch(struct max77843_muic_info *info)
{
	pr_info("%s:Force setting for DPDM\n", __func__);
	max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL1,
			0x1 << MAX77843_CTRL1_NOBCCOMP_SHIFT, MAX77843_CTRL1_NOBCCOMP_MASK);
}

static void max77843_muic_unset_dpdm_force_switch(struct max77843_muic_info *info)
{
	pr_info("%s:Force setting release\n", __func__);
	max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL1,
			0x0 << MAX77843_CTRL1_NOBCCOMP_SHIFT, MAX77843_CTRL1_NOBCCOMP_MASK);
}
#endif

static void max77843_muic_restore_wa_setting(struct max77843_muic_info *info)
{
	pr_info("%s:Forse disable WA codes.\n", __func__);
	max77843_muic_set_enable_chgdetrun(info);
#if defined(CONFIG_MUIC_SUPPORT_SMART_DOCK)
	max77843_muic_unset_dpdm_force_switch(info);
#endif
}

void max77843_muic_send_event(int val)
{
	char *envp[2];

	if (val == 0)
		envp[0] = "USB_CONNECTION=READY";
	else
		envp[0] = "USB_CONNECTION=DISCONNECTED";
	envp[1] = NULL;
	dev_info(gInfo->dev, "%s\n", __func__);
	kobject_uevent_env(&gInfo->dev->kobj, KOBJ_CHANGE, envp);
}

static int max77843_muic_set_path(struct max77843_muic_info *info, int path)
{
	u8 ctrl1_val, ctrl1_msk;
	u8 ctrl2_val, ctrl2_msk;
	int val;

	dev_info(info->dev, "set path to (%d)\n", path);

	switch (path) {
	case MAX77843_PATH_OPEN:
		val = MAX77843_MUIC_CTRL1_BIN_0_000;
		break;
	case MAX77843_PATH_USB_AP:
		val = MAX77843_MUIC_CTRL1_BIN_1_001;
		break;
	case MAX77843_PATH_AUDIO:
		val = MAX77843_MUIC_CTRL1_BIN_2_010;
		break;
	case MAX77843_PATH_UART_AP:
		val = MAX77843_MUIC_CTRL1_BIN_3_011;
		break;
	case MAX77843_PATH_USB_AUX:
		val = MAX77843_MUIC_CTRL1_BIN_4_100;
		break;
	case MAX77843_PATH_UART_AUX:
		val = MAX77843_MUIC_CTRL1_BIN_5_101;
		break;
	default:
		dev_warn(info->dev, "invalid path(%d)\n", path);
		return -EINVAL;
	}

	ctrl1_val = (val << MAX77843_CTRL1_COMN1SW_SHIFT) | (val << MAX77843_CTRL1_COMP2SW_SHIFT);
	ctrl1_msk = MAX77843_CTRL1_COMN1SW_MASK | MAX77843_CTRL1_COMP2SW_MASK;
#if defined(CONFIG_CHARGER_SMB1357)
	if (path == MAX77843_PATH_USB_AUX){
		ctrl1_val |= (1 << MAX77843_CTRL1_NOBCCOMP_SHIFT);
		ctrl1_msk |= MAX77843_CTRL1_NOBCCOMP_MASK;
	}
#endif
#if 0
	if (path == MAX77843_PATH_AUDIO) {
		ctrl1_val |= 0 << MAX77843_CTRL1_MICEN_SHIFT;
		ctrl1_msk |= MAX77843_CTRL1_MICEN_MASK;
	}
#endif
	max77843_update_reg(info->muic,
				MAX77843_MUIC_REG_CTRL1, ctrl1_val, ctrl1_msk);

	ctrl2_val = MAX77843_CTRL2_CPEn1_LOWPWD0;
	ctrl2_msk = MAX77843_CTRL2_CPEn_MASK | MAX77843_CTRL2_LOWPWD_MASK;

	max77843_update_reg(info->muic,
			MAX77843_MUIC_REG_CTRL2, ctrl2_val, ctrl2_msk);

#if defined(CONFIG_CHARGER_SMB1357)
	if (path == MAX77843_PATH_USB_AUX)
		smb1357_charger_external_apsd(true);
	else
		smb1357_charger_external_apsd(false);

	dev_info(info->dev, "%s external_apsd (%d)\n", __func__, path);
#endif
	return 0;
}

#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
#define MAX77843_PATH_FIX_USB_MASK \
	(BIT(EXTCON_USB_HOST) | BIT(EXTCON_SMARTDOCK) \
	| BIT(EXTCON_AUDIODOCK) | BIT(EXTCON_HMT) | BIT(EXTCON_MULTIMEDIADOCK))
#else
#define MAX77843_PATH_FIX_USB_MASK \
	(BIT(EXTCON_USB_HOST) | BIT(EXTCON_SMARTDOCK) \
	| BIT(EXTCON_AUDIODOCK) | BIT(EXTCON_MULTIMEDIADOCK))
#endif
#define MAX77843_PATH_USB_MASK \
	(BIT(EXTCON_USB) | BIT(EXTCON_JIG_USBOFF) | BIT(EXTCON_JIG_USBON) | BIT(EXTCON_CHARGE_DOWNSTREAM))
#define MAX77843_PATH_AUDIO_MASK BIT(EXTCON_DESKDOCK)
#define MAX77843_PATH_UART_MASK	\
	(BIT(EXTCON_JIG_UARTOFF) | BIT(EXTCON_JIG_UARTON) | BIT(EXTCON_USB_HOST_5V))
#if defined(CONFIG_CHARGER_SMB1357)
#define MAX77843_PATH_TA_MASK \
	(BIT(EXTCON_TA))
#endif

static int set_muic_path(struct max77843_muic_info *info)
{
	u32 state = info->edev->state;
	int path;
	int ret = 0;

	dev_info(info->dev, "%s: current state=0x%x, path=%s\n",
			__func__, state, max77843_path_name[info->path]);

	if (state & MAX77843_PATH_FIX_USB_MASK)
		path = MAX77843_PATH_USB_AP;
	else if (state & MAX77843_PATH_USB_MASK) {
		/* set path to usb following usb_sel */
		if (info->muic_data->usb_sel == MAX77843_PATH_USB_AUX)
			path = MAX77843_PATH_USB_AUX;
		else
			path = MAX77843_PATH_USB_AP;
	} else if (state & MAX77843_PATH_UART_MASK) {
		/* set path to uart following uart_sel */
		if (info->muic_data->uart_sel == MAX77843_PATH_UART_AUX)
			path = MAX77843_PATH_UART_AUX;
		else
			path = MAX77843_PATH_UART_AP;
	} else if (state & MAX77843_PATH_AUDIO_MASK)
		path = MAX77843_PATH_AUDIO;
#if defined(CONFIG_CHARGER_SMB1357)
	else if (state & MAX77843_PATH_TA_MASK) {
		/* set path to TA */
		path = MAX77843_PATH_USB_AUX;
	}
#endif
	else {
		dev_info(info->dev, "%s: don't have to set path\n", __func__);
		return 0;
	}

#if defined(CONFIG_MUIC_SUPPORT_RUSTPROOF)
	if (!(info->uart_en) && path == MAX77843_PATH_UART_AP) {
		dev_info(info->dev, "%s: UART is Disabled for preventing water damage\n", __func__);
		path = MAX77843_PATH_OPEN;
	}
#endif
	
	ret = max77843_muic_set_path(info, path);
	if (ret < 0) {
		dev_err(info->dev, "fail to set path(%s->%s),stat=%x,ret=%d\n",
				max77843_path_name[info->path],
				max77843_path_name[path], state, ret);
		return ret;
	}

	dev_info(info->dev, "%s: path: %s -> %s\n", __func__,
			max77843_path_name[info->path],
			max77843_path_name[path]);
	info->path = path;

	return 0;
}

static void _detected(struct max77843_muic_info *info, u32 new_state)
{
	u32 current_state;
	u32 changed_state;
	int index;
	int attach;
	int ret;
	int temp_detach[2]={0,0};

	current_state = info->edev->state;
	changed_state = current_state ^ new_state;

	dev_info(info->dev, "state: cur=0x%x, new=0x%x, changed=0x%x\n",
			current_state, new_state, changed_state);

	if((current_state != 0x0) && (new_state == 0x1)) {
		dev_info(info->dev, "Force detach.  cur=0x%x, new=0x%x, changed=0x%x\n",
				current_state, new_state, changed_state);
		new_state = 0;
	}

	if(new_state == 0)
		max77843_muic_restore_wa_setting(info);

	for (index = 0; index < SUPPORTED_CABLE_MAX; index++) {
		if (!(changed_state & BIT(index)))
			continue;

		if (new_state & BIT(index))
			attach = 1;
		else
			attach = 0;

		if (attach && !(changed_state & BIT(EXTCON_USB))) {
			dev_info(info->dev, "%s:index:%d\n", __func__, index);
			if (temp_detach[0] == 0)
				temp_detach[0] = index;
			else
				temp_detach[1] = index;
			continue;
		}

		ret = extcon_set_cable_state(info->edev,
				extcon_cable_name[index], attach);
		if (unlikely(ret < 0))
			dev_err(info->dev, "fail to notify %s(%d), %d, ret=%d\n",
				extcon_cable_name[index], index, attach, ret);
#if defined(CONFIG_CHARGER_SMB1357)
		msleep(50);
#endif
	}

	if(temp_detach[0]){
		extcon_set_cable_state(info->edev, extcon_cable_name[temp_detach[0]], 1);
		if(temp_detach[1])
			extcon_set_cable_state(info->edev, extcon_cable_name[temp_detach[1]], 1);
	}
#if defined(CONFIG_ADC_ONESHOT)
	/* Set ADC Mode to oneshot */
	if (!new_state) {
		max77843_muic_set_adcmode(info, MAX77843_ADC_ONESHOT);
	}
#endif
	set_muic_path(info);
}

static int max77843_muic_handle_attach(struct max77843_muic_info *info,
				       u8 status1, u8 status2, u8 status3, int irq)
{
	u8 adc;
	u8 vbvolt;
	u8 chgtyp;
	u8 chgdetrun;
	u8 adc1k;
	u8 vdnmon;
	u32 pre_state;
	u32 new_state;

	new_state = 0;
	pre_state = info->edev->state;

	adc = status1 & MAX77843_STATUS1_ADC_MASK;
	adc1k = status1 & MAX77843_STATUS1_ADC1K_MASK;
	chgtyp = status2 & MAX77843_STATUS2_CHGTYP_MASK;
	vbvolt = status2 & MAX77843_STATUS2_VBVOLT_MASK;
	chgdetrun = status2 & MAX77843_STATUS2_CHGDETRUN_MASK;
	vdnmon = status3 & MAX77843_STATUS3_VDNMON_MASK;

	dev_info(info->dev, "st1:0x%x st2:0x%x, st3:0x%x\n", status1, status2, status3);
	dev_info(info->dev,
		"adc:0x%x, adc1k:0x%x, chgtyp:0x%x, vbvolt:%d\n",
				adc, adc1k, chgtyp, vbvolt);
	dev_info(info->dev, "chgdetrun:0x%x, vdnmon:0x%x, prev state:0x%x\n",
				chgdetrun, vdnmon, pre_state);

	/* Workaround for Factory mode in MUIC PASS2.
	 * Abandon adc interrupt of approximately +-100K range
	 * if previous cable status was JIG UART BOOT OFF.
	 * In uart path cp, adc is unstable state
	 * MUIC PASS2 turn to AP_UART mode automatically
	 * So, in this state set correct path manually.
	 */
#if 0
	if (info->max77843->pmic_rev > MAX77843_REV_PASS1) {
		if ((pre_state & BIT(EXTCON_JIG_UARTOFF)) &&
			((adc == ADC_JIG_UART_OFF + 1 ||
			(adc == ADC_JIG_UART_OFF - 1))) &&
			(info->muic_data->uart_sel == PATH_UART_AUX)) {
			dev_warn(info->dev, "abandon ADC\n");
			new_state = BIT(EXTCON_JIG_UARTOFF);
			gInfo->cable_name = EXTCON_JIG_UARTOFF;
			goto __found_cable;
		}
	}
#endif
	/* 1Kohm ID regiter detection (mHL)
	 * Old MUIC : ADC value:0x00 or 0x01, ADCLow:1
	 * New MUIC : ADC value is not set(Open), ADCLow:1, ADCError:1
	 */
	if (adc1k) {
		new_state = BIT(EXTCON_MHL);
		gInfo->cable_name = EXTCON_MHL;
		/* If is_otg_boost is true,
		 * it means that vbolt is from the device to accessory.
		 */
		if (vbvolt) {
			new_state |= BIT(EXTCON_MHL_VB);
			gInfo->cable_name = EXTCON_MHL_VB;
		}
		goto __found_cable;
	}

	if (info->cable_name == EXTCON_HV_TA_1A){
		dev_info(info->dev, "%s: Already Undifined cable is attached. end here\n", __func__);
		new_state = BIT(EXTCON_HV_TA_1A);
		gInfo->cable_name = EXTCON_HV_TA_1A;
		goto __found_cable;
	}

	switch (adc) {
	case ADC_GND:
		max77843_muic_set_disable_chgdetrun(info);
		new_state = BIT(EXTCON_USB_HOST);
		gInfo->cable_name = EXTCON_USB_HOST;
		break;
#if defined(CONFIG_MUIC_SUPPORT_SMART_DOCK)
	case ADC_SMARTDOCK:
#if defined(CONFIG_ADC_ONESHOT)
	/* Set ADC Mode to Always */
	if (!max77843_muic_set_adcmode(info, MAX77843_ADC_ALWAYS))
		msleep(50);
#endif
		new_state = BIT(EXTCON_SMARTDOCK);
		gInfo->cable_name = EXTCON_SMARTDOCK;
		if (chgtyp == CHGTYP_DEDICATED_CHGR) {
			/* WA code for force setting when MMD attach*/
			max77843_muic_set_dpdm_force_switch(info);
			new_state |= BIT(EXTCON_SMARTDOCK_TA);
			gInfo->cable_name = EXTCON_SMARTDOCK_TA;
		} else if (chgtyp == CHGTYP_USB) {
			new_state |= BIT(EXTCON_SMARTDOCK_USB);
			gInfo->cable_name = EXTCON_SMARTDOCK_USB;
		}
		break;
#endif
#if defined(CONFIG_MUIC_SUPPORT_MULTIMEDIA_DOCK)
	case ADC_MULTIMEDIADOCK:
		if (vbvolt) {
			new_state = BIT(EXTCON_MULTIMEDIADOCK);
			gInfo->cable_name = EXTCON_MULTIMEDIADOCK;
		}
		break;
#endif
#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
	case ADC_HMT:
#if defined(CONFIG_ADC_ONESHOT)
		/* Set ADC Mode to Always */
		if (!max77843_muic_set_adcmode(info, MAX77843_ADC_ALWAYS))
			msleep(50);
#endif
		new_state = BIT(EXTCON_HMT);
		gInfo->cable_name = EXTCON_HMT;
		break;
#endif
	case ADC_JIG_UART_OFF:
		new_state = BIT(EXTCON_JIG_UARTOFF);
		gInfo->cable_name = EXTCON_JIG_UARTOFF;
		if (vbvolt) {
			if (gInfo->otg_test) {/* add for DFMS */
				new_state |= BIT(EXTCON_USB_HOST_5V);
				gInfo->cable_name = EXTCON_USB_HOST_5V;
			} else {
				new_state |= BIT(EXTCON_JIG_UARTOFF_VB);
				gInfo->cable_name = EXTCON_JIG_UARTOFF_VB;
			}
		}
		break;
	case ADC_JIG_UART_ON:
#if defined(CONFIG_SEC_FACTORY)
		new_state = BIT(EXTCON_DESKDOCK);
		gInfo->cable_name = EXTCON_DESKDOCK;
#else
		new_state = BIT(EXTCON_JIG_UARTON);
		gInfo->cable_name = EXTCON_JIG_UARTON;
#endif
		break;
#if defined(CONFIG_SEC_FACTORY)
	case ADC_CEA936ATYPE2_CHG:
		dev_info(info->dev, "%s:ADC_CEA936CHGTYP2 in FactoryMode(%x)\n", __func__, adc);
#endif
	case ADC_JIG_USB_OFF:
		if (vbvolt) {
			new_state = BIT(EXTCON_JIG_USBOFF);
			info->cable_name = EXTCON_JIG_USBOFF;
		}
		break;
	case ADC_JIG_USB_ON:
		if (vbvolt) {
			new_state = BIT(EXTCON_JIG_USBON);
			info->cable_name = EXTCON_JIG_USBON;
		}
		break;
#if defined(CONFIG_MUIC_SUPPORT_DESK_DOCK)
	case ADC_DESKDOCK:
		new_state = BIT(EXTCON_DESKDOCK);
		gInfo->cable_name = EXTCON_DESKDOCK;
		if (vbvolt) {
			new_state |= BIT(EXTCON_DESKDOCK_VB);
			gInfo->cable_name = EXTCON_DESKDOCK_VB;
		}
		break;
#endif
#if defined(CONFIG_MUIC_SUPPORT_AUDIO_DOCK)
	case ADC_AUDIODOCK:
			new_state = BIT(EXTCON_AUDIODOCK);
			gInfo->cable_name = EXTCON_AUDIODOCK;
		break;
#endif
	case ADC_CHARGING_CABLE:
		new_state = BIT(EXTCON_CHARGING_CABLE);
		gInfo->cable_name = EXTCON_CHARGING_CABLE;
		break;
	case ADC_CEA936ATYPE1_CHG:
		switch (chgtyp) {
		case CHGTYP_USB:
			dev_info(info->dev, "%s:USB\n", __func__);
			new_state = BIT(EXTCON_USB);
			info->cable_name = EXTCON_USB;
			break;
		case CHGTYP_DOWNSTREAM_PORT:
			dev_info(info->dev, "%s:CDP\n", __func__);
			new_state = BIT(EXTCON_CHARGE_DOWNSTREAM);
			info->cable_name = EXTCON_CHARGE_DOWNSTREAM;
			break;
		case CHGTYP_DEDICATED_CHGR:
		case CHGTYP_500MA:
		case CHGTYP_1A:
		case CHGTYP_RFU:
			dev_info(info->dev, "%s:TA\n", __func__);
			new_state = BIT(EXTCON_TA);
			gInfo->cable_name = EXTCON_TA;
			break;
		default:
			break;
		}
		break;
#if !defined(CONFIG_SEC_FACTORY)
	case ADC_CEA936ATYPE2_CHG:
#endif
	case ADC_OPEN:
		if (vbvolt) {
			switch (chgtyp) {
			case CHGTYP_USB:
			case CHGTYP_DOWNSTREAM_PORT:
				if (adc == ADC_CEA936ATYPE2_CHG){
					new_state = BIT(EXTCON_CEA936_CHG);
					gInfo->cable_name = EXTCON_CEA936_CHG;
				} else {
					if (chgtyp == CHGTYP_DOWNSTREAM_PORT) {
						new_state = BIT(EXTCON_CHARGE_DOWNSTREAM);
						info->cable_name = EXTCON_CHARGE_DOWNSTREAM;
					} else {
						new_state = BIT(EXTCON_USB);
						info->cable_name = EXTCON_USB;
					}
				}
				break;
			case CHGTYP_DEDICATED_CHGR:
			case CHGTYP_500MA:
			case CHGTYP_1A:
			case CHGTYP_RFU:
				dev_info(info->dev, "%s:TA\n", __func__);
				if (!info->afc_disable) {
#if defined(CONFIG_CHARGER_SMB1357)
					if ((!is_muic_check_hv(info) && chgtyp == CHGTYP_DEDICATED_CHGR))
#else
					if ((!is_muic_check_hv(info) && chgtyp == CHGTYP_DEDICATED_CHGR)
						&& irq != -1)
#endif
						max77843_muic_start_check_hv(info);
					else if ((is_muic_check_hv(info) && chgtyp == CHGTYP_DEDICATED_CHGR)
						|| irq == -1 || poweroff_charging) {
						/* WA code for initial detection for HV Charging connection 
						 * - HV Charger is attached device when booting time,
						 *   device is not recognize for that vdnmon timing issue.
						 *   this WA is input delay for recoganize vdnmon signal properly.
						 *   Input delay time when first detection(No IRQ => irq == -1)
						 */
						if(irq == -1)
							max77843_muic_delay_for_vdnmon(info);
						if(poweroff_charging || irq == -1) {
							max77843_muic_start_check_hv(info);
							max77843_muic_set_hv(info);
							if (info->cable_name == EXTCON_HV_PREPARE) {
								pr_info("%s, cable_type is Prepare  [%d]\n",
										__func__, info->cable_name);
								return 0;
							}
						}
					}
				}
				new_state = BIT(EXTCON_TA);
				gInfo->cable_name = EXTCON_TA;
				break;
			default:
				break;
			}
		}
		break;
#if defined(CONFIG_MUIC_SUPPORT_INCOMPATIBLE_CHARGER)
	case ADC_INCOMPATIBLE:
		if (vbvolt) {
			dev_warn(info->dev, "Unsupported adc=0x%x, but charging\n", adc);
			new_state = BIT(EXTCON_INCOMPATIBLE);
			gInfo->cable_name = EXTCON_INCOMPATIBLE;
		}
		break;
#endif
	default:
		if (vbvolt) {
			if(gInfo->cable_name == EXTCON_HV_TA ||
				gInfo->cable_name == EXTCON_HV_TA_ERR) {
				dev_warn(info->dev, "Changed from HV TA, Unsupported adc=0x%x\n", adc);
				new_state = BIT(EXTCON_HV_TA_1A);
				gInfo->cable_name = EXTCON_HV_TA_1A;
			} else {
				dev_warn(info->dev, "Unsupported adc=0x%x, but charging\n", adc);
				new_state = BIT(EXTCON_TA);
				gInfo->cable_name = EXTCON_TA;
			}
		} else {
			dev_warn(info->dev, "unsupported adc=0x%x\n", adc);
		}
		break;
	}

	if (!new_state) {
		dev_warn(info->dev, "Fail to get cable type (adc=0x%x)\n", adc);
		_detected(info, 0);
		return -1;
	}

__found_cable:
	_detected(info, new_state);
	max77843_update_jig_state(info);

	return 0;
}

static int max77843_muic_handle_detach(struct max77843_muic_info *info)
{
	u8 ctrl2_val;
	
	dev_info(info->dev, "adc: 0x%x, chgtyp: 0x%x, vbvolt:%d lastcable:%s\n",
		info->adc, info->chgtyp,
		info->vbvolt, extcon_cable_name[info->cable_name]);

#if defined(CONFIG_MUIC_SUPPORT_SMART_DOCK)
	if(info->cable_name == EXTCON_SMARTDOCK ||
		info->cable_name == EXTCON_SMARTDOCK_TA ||
		info->cable_name == EXTCON_SMARTDOCK_USB)
		max77843_muic_unset_dpdm_force_switch(info);
#endif

	if(info->cable_name == EXTCON_USB_HOST)
		max77843_muic_set_enable_chgdetrun(info);
	info->cable_name = EXTCON_NONE;

	if (info->is_check_hv)
		max77843_muic_set_check_hv(info, false);
	/* Workaround: irq doesn't occur after detaching mHL cable */
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_CTRL1,
					MAX77843_MUIC_CTRL1_BIN_0_000);

	/* Enable Factory Accessory Detection State Machine */

	max77843_update_reg(info->muic,
				MAX77843_MUIC_REG_CTRL2, MAX77843_CTRL2_CPEn0_LOWPWD1,
				MAX77843_CTRL2_CPEn_MASK | MAX77843_CTRL2_LOWPWD_MASK);

	max77843_read_reg(info->muic, MAX77843_MUIC_REG_CTRL2,
				&ctrl2_val);
	dev_info(info->dev, "%s: CNTL2(0x%02x)\n", __func__, ctrl2_val);

	_detected(info, 0);

	return 0;
}

static void max77843_muic_detect_dev(struct max77843_muic_info *info, int irq)
{
	struct i2c_client *client = info->muic;
	u8 status[3];
	int intr = MAX77843_INT_ATTACH;
	int ret;
	u8 cntl1_val;

	ret = max77843_read_reg(client, MAX77843_MUIC_REG_CTRL1, &cntl1_val);
	dev_info(info->dev, "func:%s CONTROL1:%x\n", __func__, cntl1_val);

	ret = max77843_bulk_read(client, MAX77843_MUIC_REG_STATUS1, 3, status);
	dev_info(info->dev, "func:%s irq:%d ret:%d\n", __func__, irq, ret);
	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg(%d)\n", __func__,
			ret);
		return;
	}

	dev_info(info->dev, "%s: STATUS1:0x%x, 2:0x%x, 3:0x%x\n", __func__,
		 status[0], status[1], status[2]);

	wake_lock_timeout(&info->muic_wake_lock, HZ * 2);

	info->adc = status[0] & MAX77843_STATUS1_ADC_MASK;
	info->chgtyp = status[1] & MAX77843_STATUS2_CHGTYP_MASK;
	info->vbvolt = status[1] & MAX77843_STATUS2_VBVOLT_MASK;

	if ((info->adc == ADC_OPEN) && (info->chgtyp == CHGTYP_NO_VOLTAGE))
		intr = MAX77843_INT_DETACH;

#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
	/*
	  * Accept the expected ADC only to
	  * keep our code safe from HMT misrecognition.
	  */
	if (gInfo->cable_name == EXTCON_HMT) {
		if ((info->adc != ADC_OPEN) && (info->adc != ADC_HMT))
			return;
	}
#endif

	if (intr == MAX77843_INT_ATTACH) {
		dev_info(info->dev, "%s: ATTACHED/CHANGED\n", __func__);
		max77843_muic_handle_attach(info, status[0], status[1], status[2], irq);
	} else if (intr == MAX77843_INT_DETACH) {
		dev_info(info->dev, "%s: DETACHED\n", __func__);
		max77843_muic_handle_detach(info);
	} else {
		pr_info("%s:%s device filtered, nothing affect.\n", DEV_NAME,
				__func__);
	}
	return;
}

static irqreturn_t max77843_muic_irq(int irq, void *data)
{
	struct max77843_muic_info *info = data;
	dev_info(info->dev, "%s: irq:%d\n", __func__, irq);

	mutex_lock(&info->mutex);
	max77843_muic_detect_dev(info, irq);
	mutex_unlock(&info->mutex);

	return IRQ_HANDLED;
}

static irqreturn_t max77843_muic_mrxrdy_irq(int irq, void *data)
{
	struct max77843_muic_info *info = data;
	dev_info(info->dev, "%s: irq:%d\n", __func__, irq);

	mutex_lock(&info->mutex);
	max77843_muic_check_handshaking(info);
	mutex_unlock(&info->mutex);

	return IRQ_HANDLED;
}

static irqreturn_t max77843_muic_vdnmon_irq(int irq, void *data)
{
	struct max77843_muic_info *info = data;
	dev_info(info->dev, "%s: irq:%d\n", __func__, irq);

	mutex_lock(&info->mutex);
	max77843_muic_set_hv(info);
	mutex_unlock(&info->mutex);

	return IRQ_HANDLED;
}

static irqreturn_t max77843_muic_vbadc_irq(int irq, void *data)
{
	struct max77843_muic_info *info = data;
	dev_info(info->dev, "%s: irq:%d\n", __func__, irq);

	mutex_lock(&info->mutex);
	max77843_muic_check_vbus_input(info);
	mutex_unlock(&info->mutex);

	return IRQ_HANDLED;
}

#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
static irqreturn_t max77843_muic_mpnack_irq(int irq, void *data)
{
	struct max77843_muic_info *info = data;
	dev_info(info->dev, "%s: irq:%d\n", __func__, irq);
	
	mutex_lock(&info->mutex);
	max77843_muic_check_qc_hv(info);
	mutex_unlock(&info->mutex);

	return IRQ_HANDLED;
}

#define REQUEST_MPNACK_IRQ(_irq, _name)					\
do {									\
	ret = request_threaded_irq(_irq, NULL, max77843_muic_mpnack_irq,\
				    0, _name, info);			\
	if (ret < 0) {							\
		dev_err(info->dev, "Failed to request IRQ #%d: %d\n",	\
			_irq, ret);					\
		return ret;						\
	}								\
} while (0)
#endif

#define REQUEST_IRQ(_irq, _name)					\
do {									\
	ret = request_threaded_irq(_irq, NULL, max77843_muic_irq,	\
				    0, _name, info);			\
	if (ret < 0) {							\
		dev_err(info->dev, "Failed to request IRQ #%d: %d\n",	\
			_irq, ret);					\
		return ret;						\
	}								\
} while (0)

#define REQUEST_MRXRDY_IRQ(_irq, _name)					\
do {									\
	ret = request_threaded_irq(_irq, NULL, max77843_muic_mrxrdy_irq,\
				    0, _name, info);			\
	if (ret < 0) {							\
		dev_err(info->dev, "Failed to request IRQ #%d: %d\n",	\
			_irq, ret);					\
		return ret;						\
	}								\
} while (0)

#define REQUEST_VDNMON_IRQ(_irq, _name)					\
do {									\
	ret = request_threaded_irq(_irq, NULL, max77843_muic_vdnmon_irq,\
				    0, _name, info);			\
	if (ret < 0) {							\
		dev_err(info->dev, "Failed to request IRQ #%d: %d\n",	\
			_irq, ret);					\
		return ret;						\
	}								\
} while (0)

#define REQUEST_VBADC_IRQ(_irq, _name)					\
do {									\
	ret = request_threaded_irq(_irq, NULL, max77843_muic_vbadc_irq,\
				    0, _name, info);			\
	if (ret < 0) {							\
		dev_err(info->dev, "Failed to request IRQ #%d: %d\n",	\
			_irq, ret);					\
		return ret;						\
	}								\
} while (0)

static int max77843_muic_irq_init(struct max77843_muic_info *info)
{
	int ret, count;
	u8 val;

	dev_info(info->dev, "func:%s\n", __func__);

#if defined(CONFIG_CHARGER_SMB1357)
	for (count = 1; count < 9 ; count ++) {
		max77843_read_reg(info->muic, count, &val);
		dev_info(info->dev, "%s: reg=%x, val=%x\n", __func__,
				count, val);
	}
#endif

	REQUEST_IRQ(info->irq_adc, "muic-adc");
	REQUEST_IRQ(info->irq_chgtype, "muic-chgtype");
	REQUEST_IRQ(info->irq_vbvolt, "muic-vbvolt");
	REQUEST_VDNMON_IRQ(info->irq_vdnmon, "muic-vdnmon");
	REQUEST_MRXRDY_IRQ(info->irq_mrxrdy, "muic-mrxrdy");
	REQUEST_VBADC_IRQ(info->irq_vbadc, "muic-vbadc");
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	REQUEST_MPNACK_IRQ(info->irq_mpnack, "muic-mpnack");

	dev_info(info->dev, "adc:%d chgtype:%d vbvolt:%d vdnmon:%d mrxrdy:%d mpnack:%d\n",
		info->irq_adc, info->irq_chgtype, info->irq_vbvolt, info->irq_vdnmon,
		info->irq_mrxrdy, info->irq_mpnack);
#else
	dev_info(info->dev, "adc:%d chgtype:%d vbvolt:%d vdnmon:%d mrxrdy:%d\n",
		info->irq_adc, info->irq_chgtype, info->irq_vbvolt, info->irq_vdnmon,
		info->irq_mrxrdy);
#endif

	/* INTMASK1  3:ADC1K 2:ADCErr 1:ADCLow 0:ADC */
	/* INTMASK2  0:Chgtype */
	/* INTMASK3  1:VDNMon */
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_INTMASK1, 0x09);
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_INTMASK2, 0x11);
#if defined(CONFIG_CHARGER_SMB1357)
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_INTMASK3, 0x00);
#else
	max77843_write_reg(info->muic, MAX77843_MUIC_REG_INTMASK3, 0x02);
#endif

	for (count = 1; count < 9 ; count ++) {
		max77843_read_reg(info->muic, count, &val);
		dev_info(info->dev, "%s: reg=%x, val=%x\n", __func__,
				count, val);
	}

	return 0;
}

static void max77843_muic_init_detect(struct work_struct *work)
{
	struct max77843_muic_info *info =
	    container_of(work, struct max77843_muic_info, init_work.work);
	struct otg_notify *n;
	int count=0;

	dev_info(info->dev, "func:%s\n", __func__);

	if (!poweroff_charging) {
		/* Polling */
		do {
			count++;
			n = get_otg_notify();
			if (n == NULL) {
				dev_info(info->dev, "%s: otg_notifier is NULL, count = %d\n", __func__, count);
				msleep(POLLING_TIME);
			}
		} while((n == NULL) && (count < ESCAPE_COUNTER));

		dev_info(info->dev, "%s: otg_notifier is not NULL, count = %d\n", __func__, count);
	}

	mutex_lock(&info->mutex);

	info->edev->state = 0;
	max77843_muic_detect_dev(info, -1);

	mutex_unlock(&info->mutex);
}

void max77843_update_jig_state(struct max77843_muic_info *info)
{
	struct i2c_client *client = info->muic;
	u8 reg_data, adc;
	int ret, jig_state;

	ret = max77843_read_reg(client, MAX77843_MUIC_REG_STATUS1, &reg_data);
	if (ret) {
		dev_err(info->dev, "%s: fail to read muic reg(%d)\n",
					__func__, ret);
		return;
	}
	adc = reg_data & MAX77843_STATUS1_ADC_MASK;

	switch (adc) {
	case ADC_JIG_UART_OFF:
	case ADC_JIG_USB_OFF:
	case ADC_JIG_USB_ON:
		jig_state = true;
		break;
	default:
		jig_state = false;
		break;
	}

	max77843_muic_uart_uevent(jig_state);
}

#if defined(CONFIG_MUIC_SUPPORT_HMT_DETECTION)
extern void muic_send_dock_intent(int type);

static int muic_handle_usb_notification(struct notifier_block *nb,
				unsigned long action, void *data)
{
	struct max77843_muic_info *info =
	    container_of(nb, struct max77843_muic_info, usb_nb);

	switch (action) {
	/* Abnormal device */
	case EXTERNAL_NOTIFY_3S_NODEVICE:
		pr_info("%s: 3S_NODEVICE(USB HOST Connection timeout)\n", __func__);
		if (info->cable_name == EXTCON_HMT)
			muic_send_dock_intent(MAX77843_MUIC_DOCK_ABNORMAL);
		break;

	default:
		break;
	}

	return NOTIFY_DONE;
}


static void muic_register_usb_notifier(struct max77843_muic_info *info)
{
	int ret = 0;

	pr_info("%s: Registering EXTERNAL_NOTIFY_DEV_MUIC.\n", __func__);


	ret = usb_external_notify_register(&info->usb_nb,
		muic_handle_usb_notification, EXTERNAL_NOTIFY_DEV_MUIC);
	if (ret < 0) {
		pr_info("%s: USB Noti. is not ready.\n", __func__);
		return;
	}

	pr_info("%s: done.\n", __func__);
}

static void muic_unregister_usb_notifier(struct max77843_muic_info *info)
{
	int ret = 0;

	pr_info("%s\n", __func__);

	ret = usb_external_notify_unregister(&info->usb_nb);
	if (ret < 0) {
		pr_info("%s: USB Noti. unregister error.\n", __func__);
		return;
	}

	pr_info("%s: done.\n", __func__);
}
#else
static void muic_register_usb_notifier(struct max77843_muic_info *info){}
static void muic_unregister_usb_notifier(struct max77843_muic_info *info){}
#endif

static int max77843_muic_probe(struct platform_device *pdev)
{
	struct max77843_dev *max77843 = dev_get_drvdata(pdev->dev.parent);
	struct max77843_platform_data *pdata = dev_get_platdata(max77843->dev);
	struct max77843_muic_info *info;
	int ret;
	u8 cdetctrl1;

	pr_info("func:%s\n", __func__);
	get_if_pmic_info();

	info = kzalloc(sizeof(struct max77843_muic_info), GFP_KERNEL);
	if (!info) {
		dev_err(&pdev->dev, "%s: failed to allocate info\n", __func__);
		ret = -ENOMEM;
		goto err_return;
	}

	info->dev = &pdev->dev;
	info->max77843 = max77843;
	info->muic = max77843->muic;
	info->irq_adc = max77843->irq_base + MAX77843_MUIC_IRQ_INT1_ADC;
	info->irq_vbvolt = max77843->irq_base + MAX77843_MUIC_IRQ_INT2_VBVOLT;
	info->irq_chgtype = max77843->irq_base + MAX77843_MUIC_IRQ_INT2_CHGTYP;
	info->irq_vdnmon = max77843->irq_base + MAX77843_MUIC_IRQ_INT3_VDNMON;
	info->irq_mrxrdy = max77843->irq_base + MAX77843_MUIC_IRQ_INT3_MRXRDY;
	info->irq_vbadc = max77843->irq_base + MAX77843_MUIC_IRQ_INT3_VBADC;
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	info->irq_mpnack = max77843->irq_base + MAX77843_MUIC_IRQ_INT3_MPNACK;
#endif
	info->muic_data = pdata->muic_data;
	info->muic_data->uart_sel = MAX77843_PATH_UART_AP;
	info->is_adc_open_prev = true;
#if !defined(CONFIG_MUIC_MAX77843_SUPPORT_CAR_DOCK)
	info->is_factory_start = false;
#endif /* !CONFIG_MUIC_MZX77843_SUPPORT_CAR_DOCK */
	info->uart_en=false;
	info->edev = devm_kzalloc(&pdev->dev, sizeof(struct extcon_dev),
			GFP_KERNEL);
	if (!info->edev) {
		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
		ret = -ENOMEM;
		goto err_info_free;
	}

	info->edev->name=EXTCON_DEV_NAME;
	info->edev->supported_cable = extcon_cable_name;

	ret = extcon_dev_register(info->edev, NULL);
	if (ret) {
		dev_err(&pdev->dev, "failed to register extcon device\n");
		goto err_info_free;
	}

	wake_lock_init(&info->muic_wake_lock, WAKE_LOCK_SUSPEND,
		"muic wake lock");

	info->cable_name = EXTCON_NONE;
	info->muic_data->usb_sel = MAX77843_PATH_USB_AP;
	/* Fix HV Charging Pin value */
	info->tx_data = 0x46;
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	info->qc_hv_mode = MAX77843_MVBUS_QC_9V;
#endif
	/* Fix HV Charging Pin value */
	gInfo = info;

	platform_set_drvdata(pdev, info);
	dev_info(info->dev, "adc:%d chgtype:%d\n",
		 info->irq_adc, info->irq_chgtype);

	if(switch_sel & 0x100)
		info->afc_disable = true;
	else
		info->afc_disable = false;
	dev_info(info->dev, "%s:AFC DISABLE : %d\n", __func__, info->afc_disable);
#if defined(CONFIG_SWITCH_DUAL_MODEM) || defined(CONFIG_MUIC_RUSTPROOF_UART)
	switch_sel &= 0xf;
	if ((switch_sel & MAX77843_SWITCH_SEL_1st_BIT_USB) == 0x1)
		info->muic_data->usb_sel = MAX77843_PATH_USB_AP;
	else
		info->muic_data->usb_sel = MAX77843_PATH_USB_AUX;

	if ((switch_sel & MAX77843_SWITCH_SEL_2nd_BIT_UART) == 0x1 << 1)
		info->muic_data->uart_sel = MAX77843_PATH_UART_AP;
	else
		info->muic_data->uart_sel = MAX77843_PATH_UART_AUX;

	pr_err("%s: switch_sel: %x\n", __func__, switch_sel);
#endif

	/* create sysfs group */
	ret = sysfs_create_group(&switch_dev->kobj, &max77843_muic_group);
	pr_info("dev_set_drvdata:%s\n", __func__);
	dev_set_drvdata(switch_dev, info);
	if (ret) {
		dev_err(&pdev->dev,
			"failed to create max77843 muic attribute group\n");
		goto err_input;
	}
	mutex_init(&info->mutex);

	/* Set ADC debounce time: 25ms */
	max77843_muic_set_adcdbset(info, 2);
	/* Set DCDTmr to 2sec */
	max77843_read_reg(info->max77843->muic,
		MAX77843_MUIC_REG_CDETCTRL1, &cdetctrl1);
	cdetctrl1 &= ~(1 << 5);
	max77843_write_reg(info->max77843->muic,
		MAX77843_MUIC_REG_CDETCTRL1, cdetctrl1);
	pr_info("%s: CDETCTRL1(0x%02x)\n", __func__, cdetctrl1);

	/*  Get ADC Mode value */
	max77843_read_reg(info->max77843->muic,
		MAX77843_MUIC_REG_CTRL4, &info->adc_mode);
	info->adc_mode = info->adc_mode >> MAX77843_CTRL4_ADCMODE_SHIFT;
	pr_info("%s: ADCMODE(0x%x)\n", __func__, info->adc_mode);
	
	ret = switch_dev_register(&switch_uart3);
	if (ret < 0) {
		pr_err("%s : Failed to register switch_uart3 device\n", __func__);
		goto err_switch_uart3_dev_register;
	}

#if defined(CONFIG_MUIC_SUPPORT_RUSTPROOF)
	if ( (switch_sel&0x08) == 0x00 ) {
		/* MAKE PATH OPEN */
		max77843_muic_set_path(info, MAX77843_PATH_OPEN);
		pr_info("%s: uart en bit : %d\n", __func__, (switch_sel&0x08));
		pr_info("%s: MUIC path is OPEN from now.\n", __func__);
	} else {
		pr_info("%s: uart en bit : %d\n", __func__, (switch_sel&0x08));
		info->uart_en = true;
	}
#endif

	/* initial cable detection */
	INIT_DELAYED_WORK(&info->init_work, max77843_muic_init_detect);
	schedule_delayed_work(&info->init_work, msecs_to_jiffies(3000));
	INIT_DELAYED_WORK(&info->afc_err_detect_work, max77843_muic_afc_err_detect);

	/* init jig state */
	max77843_update_jig_state(info);
	muic_register_usb_notifier(info);
	ret = max77843_muic_irq_init(info);
	if (ret < 0) {
		dev_err(&pdev->dev, "Failed to initialize MUIC irq:%d\n", ret);
		goto fail;
	}

	return 0;

 fail:
	if (info->irq_adc)
		free_irq(info->irq_adc, NULL);
	if (info->irq_chgtype)
		free_irq(info->irq_chgtype, NULL);
	if (info->irq_vbvolt)
		free_irq(info->irq_vbvolt, NULL);
	if (info->irq_vdnmon)
		free_irq(info->irq_vdnmon, NULL);
	if (info->irq_mrxrdy)
		free_irq(info->irq_mrxrdy, NULL);
	if (info->irq_vbadc)
		free_irq(info->irq_vbadc, NULL);
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
	if (info->irq_mpnack)
		free_irq(info->irq_mpnack, NULL);
#endif
	switch_dev_unregister(&switch_uart3);
 err_switch_uart3_dev_register:
	mutex_destroy(&info->mutex);
 err_input:
	platform_set_drvdata(pdev, NULL);
	wake_lock_destroy(&info->muic_wake_lock);
 err_info_free:
	kfree(info);
 err_return:
	return ret;
}

#if !defined(CONFIG_SEC_FACTORY)
static int max77843_suspend(struct device *dev)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;

	dev_info(info->dev, "%s: LowPwr Enable\n", __func__);
	val = (0 << MAX77843_CTRL2_LOWPWD_SHIFT);

	ret = max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL2, val,
			MAX77843_CTRL2_LOWPWD_MASK);
	if (ret < 0) {
		dev_err(info->dev, "%s: fail to update reg\n", __func__);
		return -1;
	}
	return 0;
}

static int max77843_resume(struct device *dev)
{
	return 0;
}

static const struct dev_pm_ops max77843_dev_pm_ops = {
	.suspend	= max77843_suspend,
	.resume		= max77843_resume,
};
#endif

static int max77843_muic_remove(struct platform_device *pdev)
{
	struct max77843_muic_info *info = platform_get_drvdata(pdev);
	sysfs_remove_group(&switch_dev->kobj, &max77843_muic_group);

	if (info) {
		dev_info(info->dev, "func:%s\n", __func__);
		cancel_delayed_work(&info->init_work);
		free_irq(info->irq_adc, info);
		free_irq(info->irq_chgtype, info);
		free_irq(info->irq_vbvolt, info);
		free_irq(info->irq_vdnmon, info);
		free_irq(info->irq_mrxrdy, info);
		free_irq(info->irq_vbadc, info);
#if defined(CONFIG_MUIC_SUPPORT_QC_CHARGER)
		free_irq(info->irq_mpnack, info);
#endif
		wake_lock_destroy(&info->muic_wake_lock);

		muic_unregister_usb_notifier(info);
		mutex_destroy(&info->mutex);
		kfree(info);
	}
	return 0;
}

void max77843_muic_shutdown(struct device *dev)
{
	struct max77843_muic_info *info = dev_get_drvdata(dev);
	int ret;
	u8 val;
	dev_info(info->dev, "func:%s\n", __func__);
	if (!info->muic) {
		dev_err(info->dev, "%s: no muic i2c client\n", __func__);
		return;
	}

	dev_info(info->dev, "%s: LowPwr Enable\n", __func__);
	val = (0 << MAX77843_CTRL2_LOWPWD_SHIFT);

	ret = max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL2, val,
			MAX77843_CTRL2_LOWPWD_MASK);
	if (ret < 0) {
		dev_err(info->dev, "%s: fail to update reg\n", __func__);
		return;
	}

	dev_info(info->dev, "%s: JIGSet: auto detection\n", __func__);
	val = (0 << MAX77843_CTRL3_JIGSET_SHIFT);

	ret = max77843_update_reg(info->muic, MAX77843_MUIC_REG_CTRL3, val,
			MAX77843_CTRL3_JIGSET_MASK);
	if (ret < 0) {
		dev_err(info->dev, "%s: fail to update reg\n", __func__);
		return;
	}
	muic_unregister_usb_notifier(info);
}

static struct platform_driver max77843_muic_driver = {
	.driver		= {
		.name	= DEV_NAME,
		.owner	= THIS_MODULE,
#if !defined(CONFIG_SEC_FACTORY)
		.pm	= &max77843_dev_pm_ops,
#endif
		.shutdown = max77843_muic_shutdown,
	},
	.probe		= max77843_muic_probe,
	.remove		= max77843_muic_remove,
};

static int __init max77843_muic_init(void)
{
	pr_info("func:%s\n", __func__);
	return platform_driver_register(&max77843_muic_driver);
}
module_init(max77843_muic_init);

static void __exit max77843_muic_exit(void)
{
	pr_info("func:%s\n", __func__);
	platform_driver_unregister(&max77843_muic_driver);
}
module_exit(max77843_muic_exit);


MODULE_DESCRIPTION("Maxim MAX77843 MUIC driver");
MODULE_AUTHOR("<sukdong.kim@samsung.com>");
MODULE_LICENSE("GPL");
