#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

function createAvailableSite() {
  if true; then
    cat <<- EOF > $@
    server {}
    EOF
  fi;
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

createAvailableSite ${RPC_URL}
