#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

function createAvailableSite() {
cat <<- EOF > /tmp/${1}
server {
  listen 80;
  listen [::]80;

  server_name ${1};

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

echo -e "${yellow}--- Installing Certbot${endColor}"
echo

#yum install python-certbot-nginx

echo
echo -e "${green}✓ Done!${endColor}"
echo

#mkdir /etc/nginx/sites-available
#mkdir /etc/nginx/sites-enabled

#mv ./nginx.conf /etc/nginx/nginx.conf

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

  nginx -t /tmp/${RPC_URL}
  mv /tmp/${RPC_URL} /etc/nginx/sites-available/${RPC_URL}
  ln -s /etc/nginx/sites-available/${RPC_URL} /etc/nginx/sites-enabled/${RPC_URL}

  echo
  echo -e "${yellow}--- Adding ${RPC_PORT} port to SELinux${endColor}"
  echo

  semanage port --add --type http_port_t --proto tcp ${RPC_PORT}
  semanage port --add --type http_port_t --proto udp 9732
fi

if [ -z ${MONITOR_URL} ]; then
  echo "${red}MONITOR_URL is unset${endColor}";
else
  createAvailableSite ${MONITOR_URL} ${MONITOR_PORT}

  echo
  echo -e "${yellow}--- Testing config for ${MONITOR_URL}${endColor}"
  echo

  nginx -t /tmp/${MONITOR_URL}
  mv /tmp/${MONITOR_URL} /etc/nginx/sites-available/${MONITOR_URL}
  ln -s /etc/nginx/sites-available/${MONITOR_URL} /etc/nginx/sites-enabled/${MONITOR_URL}

  echo
  echo -e "${yellow}--- Adding ${MONITOR_PORT} port to SELinux${endColor}"
  echo

  semanage port -m -t http_port_t -p tcp ${MONITOR_PORT}
fi

if [ -z ${TZKT_URL} ]; then
  echo "${red}TZKT_URL is unset${endColor}";
else
  createAvailableSite ${TZKT_URL} ${TZKT_PORT}

  echo
  echo -e "${yellow}--- Testing config for ${TZKT_URL}${endColor}"
  echo

  nginx -t /tmp/${TZKT_URL}
  mv /tmp/${TZKT_URL} /etc/nginx/sites-available/${TZKT_URL}
  ln -s /etc/nginx/sites-available/${TZKT_URL} /etc/nginx/sites-enabled/${TZKT_URL}

  echo
  echo -e "${yellow}--- Adding ${TZKT_PORT} port to SELinux${endColor}"
  echo

  semanage port -m -t http_port_t -p tcp ${TZKT_PORT}
fi

echo
echo -e "${yellow}--- Reloading firewall service${endColor}"
echo

systemctl reload firewalld

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo -e "${yellow}--- Reloading NGINX service${endColor}"
echo

systemctl reload nginx

echo
echo -e "${green}✓ Done!${endColor}"
echo
