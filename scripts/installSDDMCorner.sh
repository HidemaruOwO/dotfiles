#!/usr/bin/env bash

git clone https://github.com/aczw/sddm-theme-corners.git /tmp/sddm-theme-corners
cd /tmp/sddm-theme-corners
sudo cp -r corners/ /usr/share/sddm/themes/
cat <<EOF >>/tmp/theme.conf
[Theme]
Current=corners
EOF
sudo mkdir -p /etc/sddm.conf.d
sudo mv /tmp/theme.conf /etc/sddm.conf.d/theme.conf
sudo systemctl enable sddm
