#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-
#mkdir output

#make -j1 -C $(pwd) O=output VARIANT_DEFCONFIG=apq8084_sec_trlte_chnzn_defconfig apq8084_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
#make -j1 -C $(pwd) O=output
make -j1   VARIANT_DEFCONFIG=apq8084_sec_trlte_chnzn_defconfig apq8084_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j1

DTS=arch/arm/boot/dts

./tools/dtbTool -o ./dt.img -v -s 2048 -p ./scripts/dtc/ $DTS/

cp arch/arm/boot/zImage AiK-N9100/split_img/boot.img-zImage

AiK-N9100/repackimg.sh

