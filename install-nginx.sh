#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

function createAvailableSite() {
cat <<- EOF > ${1}
server {
  listen 80;
  listen [::]80;

  server_name ${1}

  location/ {
    include proxy_params;
    proxy_pass http://127.0.0.1:${2};
  }
}
EOF
}

echo
echo -e "${yellow}**********************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's NGINX and SSL install script! *${endColor}"
echo -e "${yellow}**********************************************************${endColor}"
echo
echo -e "${yellow}--- Installing NGINX${endColor}"
echo

#yum install nginx -q

echo
echo -e "${green}✓ Done!${endColor}"
echo

#mkdir /etc/nginx/sites-available
#mkdir /etc/nginx/sites-enabled

#mv ./nginx.conf /etc/nginx/nginx.conf

if [ -z ${RPC_URL} ]; then
  echo "RPC_URL is unset";
else
  createAvailableSite ${RPC_URL} ${RPC_PORT}

if [ -z ${MONITOR_URL} ]; then
  echo "MONITOR_URL is unset";
else
  createAvailableSite ${MONITOR_URL} ${MONITOR_PORT}

if [ -z ${TZKT_URL} ]; then
  echo "MONITOR_URL is unset";
else
  createAvailableSite ${TZKT_URL} ${TZKT_PORT}
