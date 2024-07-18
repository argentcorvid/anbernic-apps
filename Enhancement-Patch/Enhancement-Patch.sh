#!/usr/bin/env bash
#
# https://github.com/exdial/anbernic-apps

# Configure timezone
timedatectl set-timezone "Etc/UTC" #"America/Chicago" or whatever
timedatectl set-ntp true
dpkg-reconfigure -f noninteractive tzdata

# Configure locale
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale
dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=en_US.UTF-8

# Disable unused services
systemctl stop ModemManager
systemctl disable ModemManager

cp -f ./res/enhancement/sources.txt /etc/apt/sources.list
apt-get update

exit 0
