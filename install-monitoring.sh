#!/bin/bash

source ./config/colors.sh
source ./config/config.sh
source ./nginx/utils.sh

echo
echo -e "${yellow}*************************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's Monitoring stack install script! *${endColor}"
echo -e "${yellow}*************************************************************${endColor}"
echo
echo -e "${yellow}--- Cloning Monitoring stack${endColor}"
echo

git clone https://github.com/vegasbrianc/prometheus ${TEZOS_PATH}/prometheus

echo
echo -e "${yellow}--- Customising stack${endColor}"
echo

mv ./monitoring/config.monitoring ${TEZOS_PATH}/prometheus/grafana/config.monitoring
mv ./monitoring/docker-stack.yml ${TEZOS_PATH}/prometheus/docker-stack.yml
mv ./monitoring/prometheus.yml ${TEZOS_PATH}/prometheus/prometheus/prometheus.yml
mv ./monitoring/datasource.yml ${TEZOS_PATH}/prometheus/grafana/provisioning/datasources/datasource.yml
mv ./monitoring/tezos-dashboard.json ${TEZOS_PATH}/prometheus/dashboard/tezos-dashboard.yml

echo
echo -e "${yellow}--- Deploying Monitoring stack${endColor}"
echo

cd ${TEZOS_PATH}/prometheus
docker stack deploy -c ./docker-stack.yml prom

if [ -z ${MONITOR_URL} ]; then
  echo "${red}MONITOR_URL is unset${endColor}";
else
  echo
  echo -e "${yellow}--- Setting NGINX for stack${endColor}"
  echo

  createAvailableSite ${MONITOR_URL} ${MONITOR_PORT}

  echo
  echo -e "${yellow}--- Testing config for ${MONITOR_URL}${endColor}"
  echo

  mv /tmp/${MONITOR_URL} /etc/nginx/sites-available/${MONITOR_URL}
  ln -s /etc/nginx/sites-available/${MONITOR_URL} /etc/nginx/sites-enabled/${MONITOR_URL}
  nginx -t

  echo
  echo -e "${yellow}--- Adding port ${MONITOR_PORT} to SELinux ${endColor}"
  echo

  semanage port -m -t http_port_t -p tcp ${MONITOR_PORT}

  echo
  echo -e "${yellow}--- Getting certificates with Certbot for ${MONITOR_URL}${endColor}"
  echo

  certbot --nginx --non-interactive --agree-tos -d ${MONITOR_URL} -m ${CERTBOT_EMAIL}
fi
