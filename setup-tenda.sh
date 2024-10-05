#!/bin/bash
sudo apt-get update
wget https://static.tenda.com.cn/tdeweb/download/W311MI/W311MiV6.0%20Driver%20for%20Linux(3.10-6.8).zip -O package.zip
unzip package.zip

sudo dpkg -i *.deb

sudo apt-get install -f
sudo apt-get install raspberrypi-kernel-headers

echo "dtoverlay=disable-wifi" | sudo tee -a /boot/firmware/config.txt

echo "blacklist brcmfmac" | sudo tee -a /etc/modprobe.d/raspi-blacklist.conf


# Prompt user to confirm the reboot
read -p "Reboot is required to apply changes. Do you want to reboot now? (y/n): " answer

# Check user response
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Rebooting the system..."
    sudo reboot
else
    echo "Please reboot manually later to apply changes."
fi
