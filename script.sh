#! /bin/bash
exit 1
sudo apt update
sudo apt upgrade -y
mkdir /install/
cp ./* /install/
chmod +x /install/custom-greeter.py
echo ""
echo ""
echo ""
echo ""
echo "Apt updates done and moving of files done."
echo "(1/5)"
echo ""
echo ""
echo ""
sudo dphys-swapfile swapoff
sudo sed -i -e 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=4096/g' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
echo ""
echo ""
echo ""
echo ""
echo "Swap Enabled"
echo "(2/5)"
echo ""
echo ""
echo ""
sudo apt install xserver-xorg --no-install-recommends --no-install-suggests -y
sudo apt install xfce4 -y
sudo apt install xfce4-terminal -y # Terminal
sudo apt install neofetch -y # Sys stat util
sudo apt install lightdm --no-install-recommends --no-install-suggests -y # Login Manager
sudo apt install lightdm-gtk-greeter --no-install-recommends --no-install-suggests -y # Technically no req but good to lock
sudo apt install python3 # Install Python
sudo apt install liblightdm-gobject-dev # Python Dependency to run the custom greeter
sudo systemctl enable --now lightdm
echo ""
echo ""
echo ""
echo ""
echo "GUI installed"
echo "(3/5)"
echo ""
echo ""
echo ""

sudo sed -i 's/#greeter-session=.*$/greeter-session=custom-greeter/' /etc/lightdm/lightdm.conf # Set to use custom greeter
sudo cp ./custom-greeter.desktop /usr/share/xgreeters/
