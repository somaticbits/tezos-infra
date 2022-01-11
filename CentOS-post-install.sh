#!/bin/bash
bold=$'\e[1;0m'
red=$'\e[0;31m'
boldRed=$'\e[1;31m'
green=$'\e[0;32m'
boldGreen=$'\e[1;32m'
yellow=$'\e[0;33m'
boldYellow=$'\e[1;33m'
blue=$'\e[0;34m'
boldBlue=$'\e[1;34m'
close=$'\e[0m'

echo '\e[1;0m'Welcome to SOMATICBITS\'s Centos 7 post install script!'\e[0m'
echo
echo 'Updating system...'
echo
yum update -yyy

echo '\e[1;32m'System is updated.'\e[0m'
echo
echo 'Adding Epel repo...'

yum install epel-release -y

echo
echo '\e[1;32m'Done!'\e[0m'
echo

yum update

echo
echo '\e[1;0m'Installing Development tools and few other things...'\e[0m'
echo

yum install nano git -y
yum group install 'Development Tools' -y
yum install yum-utils device-mapper-persistent-data lvm2 -y
yum install python-pip -y
pip install --upgrade pip

echo
echo '\e[1;32m'Done!'\e[0m'
echo

echo '\e[1;0m'Adding Docker Community Edition repository and installing docker-ce with docker-compose...'\e[0m'
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
echo '\e[1;32m'Done!'\e[0m'
echo

echo '\e[1;0m'Installing NTP syncing...'\e[0m'
yum install ntp ntpdate
systemctl start ntpd
systemctl enable ntpd
ntpdate -u -s 0.eu.pool.ntp.org 1.eu.pool.ntp.org 2.eu.pool.ntp.org 3.eu.pool.ntp.org
systemctl restart ntpd
hwclock -w

echo
echo '\e[1;32m'Done!'\e[0m'
echo

mkdir .ssh
touch .ssh/authorized_keys
chmod -R 600 .ssh/
