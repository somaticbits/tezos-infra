#!/bin/bash

red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

echo
echo -e "${yellow}**********************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's Centos 7 post install script! *${endColor}"
echo -e "${yellow}**********************************************************${endColor}"
echo
echo -e "${yellow}--- Updating system${endColor}"
echo

yum update -yyy -q

echo
echo "${yellow}--- Adding Epel repo${endColor}"
echo

yum install epel-release -yyy -q
yum update -yyy -q

echo
echo -e "${yellow}--- Installing nano, git, pip, Development tools${endColor}"
echo

yum install nano git -y -q
yum group install 'Development Tools' -y -q
yum install yum-utils device-mapper-persistent-data lvm2 -y -q
yum install python-pip -y -q

echo
echo -e "${yellow}--- Adding Docker Community Edition repo and installing docker-ce with docker-compose${endColor}"
echo

PLATFORM=$(uname -s)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-${PLATFORM,}-$(uname -m)" -o /usr/local/bin/docker-compose
cp /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
yum upgrade python* -q
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum update -q
yum install docker-ce -yy -q
systemctl start docker
systemctl enable docker

echo
echo "${yellow}--- Installing NTP syncing${endColor}"
echo

yum install ntp ntpdate -y -q
systemctl start ntpd
systemctl enable ntpd
ntpdate -u -s 0.de.pool.ntp.org 1.de.pool.ntp.org 2.de.pool.ntp.org 3.de.pool.ntp.org
systemctl restart ntpd
hwclock -w

mkdir .ssh
touch .ssh/authorized_keys
chmod -R 600 .ssh/
