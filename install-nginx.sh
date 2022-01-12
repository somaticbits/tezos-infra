#!/bin/bash

source ./config/colors.sh
source ./config/config.sh
source ./nginx/utils.sh

echo
echo -e "${yellow}**************************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's NGINX and Certbot install script! *${endColor}"
echo -e "${yellow}**************************************************************${endColor}"
echo
echo -e "${yellow}--- Installing NGINX${endColor}"
echo

yum install nginx -y -q

echo
echo -e "${yellow}--- Installing Certbot${endColor}"
echo

yum install python-certbot-nginx -y -q

mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

mv ./nginx/nginx.conf /etc/nginx/nginx.conf
mv ./nginx/proxy_params /etc/nginx/proxy_params

echo
echo -e "${yellow}--- Setting up URLs${endColor}"
echo

if [ -z ${RPC_URL} ]; then
  echo "${red}RPC_URL is unset, please set it before continuing!${endColor}";
  exit 1;
else
  createAvailableSite ${RPC_URL} ${RPC_PORT}

  echo
  echo -e "${yellow}--- Testing config for ${RPC_URL}${endColor}"
  echo

  mv /tmp/${RPC_URL} /etc/nginx/sites-available/${RPC_URL}
  ln -s /etc/nginx/sites-available/${RPC_URL} /etc/nginx/sites-enabled/${RPC_URL}
  nginx -t

  echo
  echo -e "${yellow}--- Adding port ${RPC_PORT} to SELinux${endColor}"
  echo

  semanage port --add --type http_port_t --proto tcp ${RPC_PORT}
  semanage port --add --type http_port_t --proto udp 9732

  echo
  echo -e "${yellow}--- Getting certificates with Certbot for ${RPC_URL}${endColor}"
  echo

  certbot --nginx --non-interactive --agree-tos -d ${RPC_URL} -m ${CERTBOT_EMAIL}
fi

if [ -z ${TZKT_URL} ]; then
  echo "${red}TZKT_URL is unset${endColor}";
else
  createAvailableSite ${TZKT_URL} ${TZKT_PORT}

  echo
  echo -e "${yellow}--- Testing config for ${TZKT_URL}${endColor}"
  echo

  mv /tmp/${TZKT_URL} /etc/nginx/sites-available/${TZKT_URL}
  ln -s /etc/nginx/sites-available/${TZKT_URL} /etc/nginx/sites-enabled/${TZKT_URL}
  nginx -t

  echo
  echo -e "${yellow}--- Adding port ${TZKT_PORT} to SELinux${endColor}"
  echo

  semanage port -m -t http_port_t -p tcp ${TZKT_PORT}

  echo
  echo -e "${yellow}--- Getting certificates with Certbot for ${TZKT_URL}${endColor}"
  echo

  certbot --nginx --non-interactive --agree-tos -d ${TZKT_URL} -m ${CERTBOT_EMAIL}
fi

echo
echo -e "${yellow}--- Reloading firewall service${endColor}"
echo

systemctl reload firewalld

echo
echo -e "${yellow}--- Starting NGINX service${endColor}"
echo

systemctl start nginx
systemctl enable nginx
