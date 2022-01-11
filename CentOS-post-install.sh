#!/bin/bash
bold=$'\e[1;0m'
italic=$'\e[3:0m'
red=$'\e[0;31m'
boldRed=$'\e[1;31m'
green=$'\e[0;32m'
boldGreen=$'\e[1;32m'
yellow=$'\e[0;33m'
boldYellow=$'\e[1;33m'
blue=$'\e[0;34m'
boldBlue=$'\e[1;34m'
endColor=$'\e[0m'

echo -e "${bold}Welcome to SOMATICBITS's Centos 7 post install script!${endColor}"
echo
echo -e "${italic}Updating system...${endColor}"
echo
yum update -yyy

echo -e "${boldGreen}System is updated.${endColor}"
echo
echo "${italic}Adding Epel repo...${endColor}"

yum install epel-release -y

echo
echo -e "${boldGreen}Done!${endColor}"
echo

yum update

echo
echo -e "${bold}Installing Development tools and few other things...${endColor}"
echo

yum install nano git -y
yum group install 'Development Tools' -y
yum install yum-utils device-mapper-persistent-data lvm2 -y
yum install python-pip -y
pip install --upgrade pip

echo
echo -e "${boldGreen}Done!${endColor}"
echo

echo -e "${italic}Adding Docker Community Edition repository and installing docker-ce with docker-compose...${endColor}"
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
echo -e "${boldGreen}Done!${endColor}"
echo

echo "${italic}Installing NTP syncing...${endColor}"
yum install ntp ntpdate
systemctl start ntpd
systemctl enable ntpd
ntpdate -u -s 0.eu.pool.ntp.org 1.eu.pool.ntp.org 2.eu.pool.ntp.org 3.eu.pool.ntp.org
systemctl restart ntpd
hwclock -w

echo
echo -e "${boldGreen}Done!${endColor}"
echo

mkdir .ssh
touch .ssh/authorized_keys
chmod -R 600 .ssh/
