#!/bin/bash

# https://github.com/zellneralex/klipper_config/blob/master/script/update_mcu.sh
#Chiamare da SSH il script com:  
#cd /home/pi/printer_data/config/scripts/
#bash update_mcu_katapult.sh

#cd /home/pi/printer_data/config/scripts/
#bash update_mcu_katapult.sh

cd ~/katapult

## Update mcu ERCF KATAPULT
echo "Start update katapult mcu ERCF"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_katapult
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_katapult
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_katapult
read -p "mcu ERCF firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -r
read -p "mcu ERCF firmware Bootloader interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu ERCF firmware interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -f ~/katapult/out/deployer.bin
read -p "mcu ERCF firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu ERCF"
echo ""

## Update mcu ERCF kLIPPER
cd ~/klipper
sudo service klipper stop
echo "Start update mcu ERCF KLIPPER"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.ercf_mcu
read -p "mcu ERCF firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
#cd ~/katapult/scripts
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -r
read -p "mcu ERCF firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu ERCF firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -f ~/klipper/out/klipper.bin
read -p "mcu ERCF firmware interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -q
read -p "mcu ERCF firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu ERCF KLIPPER"
echo ""

sudo service klipper start

## Update mcu OCTOPUS V1.1 KATAPULT
echo "Start update katapult mcu OCTOPUS V1.1"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus_katapult
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus_katapult
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus_katapult
read -p "mcu OCTOPUS V1.1 firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 06b1b3ebd015 -r
read -p "mcu OCTOPUS V1.1 firmware Bootloader interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu OCTOPUS V1.1 firmware interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 06b1b3ebd015 -f ~/katapult/out/deployer.bin
read -p "mcu OCTOPUS V1.1 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu OCTOPUS V1.1"
echo ""


## Update mcu Octopus V1.1 kLIPPER
cd ~/klipper
sudo service klipper stop
echo "Start update mcu Octopus V1.1 KLIPPER"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.octopus
read -p "mcu OCTOPUS V1.1 firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
#cd ~/katapult/scripts
python3 ~/katapult/scripts/flashtool.py -i can0 -u 06b1b3ebd015 -r
read -p "mcu OCTOPUS V1.1 firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu OCTOPUS V1.1 firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 06b1b3ebd015 -f ~/klipper/out/klipper.bin
read -p "mcu OCTOPUS V1.1 firmware Interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -q
read -p "mcu OCTOPUS V1.1 firmware Flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu Octopus V1.1 KLIPPER"
echo ""

sudo service klipper start

cd ~/katapult

## Update mcu EBBCan KATAPULT
echo "Start update katapult mcu EBBCan"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_katapult
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_katapult
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_katapult
read -p "mcu EBBCan firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 9cdf2903c5b2 -r
read -p "mcu EBBCan firmware Bootloader interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu EBBCan firmware interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 9cdf2903c5b2 -f ~/katapult/out/deployer.bin
read -p "mcu EBBCan firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu EBBCan"
echo ""

## Update mcu EBBCan kLIPPER
cd ~/klipper
sudo service klipper stop
echo "Start update mcu EBBCan KLIPPER"
echo ""
make clean
make clean KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
make menuconfig KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
make KCONFIG_CONFIG=/home/pi/printer_data/config/scripts/config.EBBCan_mcu
read -p "mcu EBBCan firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
#cd ~/katapult/scripts
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -r
read -p "mcu EBBCan firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -q
read -p "mcu EBBCan firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -u 5f771ac517d7 -f ~/klipper/out/klipper.bin
read -p "mcu EBBCan firmware interogate, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
python3 ~/katapult/scripts/flashtool.py -i can0 -q
read -p "mcu EBBCan firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu EBBCan KLIPPER"
echo ""

sudo service klipper start







