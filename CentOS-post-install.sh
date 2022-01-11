#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

echo
echo -e "${yellow}Welcome to SOMATICBITS's Centos 7 post install script!${endColor}"
echo
echo -e "----------- Updating system..."
echo

yum update -yyy

echo
echo -e "${green}System is updated.${endColor}"
echo
echo "----------- Adding Epel repo..."
echo

yum install epel-release -y

echo
echo -e "${green}✓ Done!${endColor}"
echo

yum update

echo
echo -e "----------- Installing Development tools and few other things..."
echo

yum install nano git -y
yum group install 'Development Tools' -y
yum install yum-utils device-mapper-persistent-data lvm2 -y
yum install python-pip -y
pip install --upgrade pip

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo -e "----------- Adding Docker Community Edition repository and installing docker-ce with docker-compose..."
platform=$(uname -s)
curl -L 'https://github.com/docker/compose/releases/latest/download/docker-compose-${platform,}-$(uname -m)'  -o /usr/local/bin/docker-compose
cp /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
yum upgrade python*
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum update
yum install docker-ce -yy
systemctl start docker
systemctl enable docker

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo "----------- Installing NTP syncing..."
yum install ntp ntpdate -y
systemctl start ntpd
systemctl enable ntpd
ntpdate -u -s 0.de.pool.ntp.org 1.de.pool.ntp.org 2.de.pool.ntp.org 3.de.pool.ntp.org
systemctl restart ntpd
hwclock -w

echo
echo -e "${green}✓ Done!${endColor}"
echo

mkdir .ssh
touch .ssh/authorized_keys
chmod -R 600 .ssh/
