#!/bin/bash

# https://github.com/zellneralex/klipper_config/blob/master/script/update_mcu.sh
#Chiamare da SSH il script com:  
#cd /home/pi/printer_data/config/scripts/
#bash update_mcu.sh

#cd /home/pi/printer_data/config/scripts/
#bash update_mcu.sh

sudo service klipper stop
cd ~/klipper

# Update mcu rpi
echo "Start update mcu rpi"
echo ""

make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.linux_mcu
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.linux_mcu
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.linux_mcu
read -p "mcu rpi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.linux_mcu
echo "Finish update mcu rpi"
echo ""

# Update mcu ERCF
echo "Start update mcu ERCF"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
read -p "mcu ERCF firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
#./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_0700001880A037AFD1E7BF5BC62000F5-if00 btt-skr-turbo-v1.4
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 5f771ac517d7
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -u 5f771ac517d7 -f ~/klipper/out/klipper.bin
cd ~/katapult/scripts 
python3 flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u 5f771ac517d7
read -p "mcu ERCF firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu ERCF"
echo ""

#echo "Building RP2040 firmware"
#make clean KCONFIG_CONFIG=.config_rp2040
#make menuconfig KCONFIG_CONFIG=.config_rp2040
#make KCONFIG_CONFIG=.config_rp2040


## Update mcu OCTOPUS V1.1
echo "Start update mcu OCTOPUS V1.1"
echo ""
cd
cd ~/klipper
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
read -p "mcu OCTOPUS firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 6b1b3ebd015
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -u 06b1b3ebd015 -f ~/klipper/out/klipper.bin
cd ~/katapult/scripts
python3 flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u 06b1b3ebd015
read -p "mcu OCTOPUS firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu OCTOPUS"
echo ""


## Update mcu EBBCan
echo "Start update mcu EBBCan"
echo ""
cd
cd ~/klipper
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
read -p "mcu EBBCan firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 5fb25093d789
#python3 ~/CanBoot/scripts/flash_can.py -i can0 -u 9cdf2903c5b2 -f ~/klipper/out/klipper.bin
cd ~/katapult/scripts
python3 flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u 9cdf2903c5b2
read -p "mcu EBBCan firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu EBBCan"
echo ""

sudo service klipper start

