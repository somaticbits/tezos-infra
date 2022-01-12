#!/bin/bash

source ./config/colors.sh
source ./config/config.sh

echo
echo -e "${yellow}************************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's Tezos full node install script! *${endColor}"
echo -e "${yellow}************************************************************${endColor}"
echo
echo -e "${yellow}--- Pulling Tezos Docker image${endColor}"
echo

docker pull tezos/tezos:${TEZOS_VERSION}

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo -e "${yellow}--- Creating folders for permanent storage${endColor}"

# Creating folders for permanent storage of Docker volumes
mkdir -p ${TEZOS_PATH}/node
chmod 777 ${TEZOS_PATH}/node

echo
echo -e "${green}✓ Done!${endColor}"
echo

chmod +x ./node/*
./node/get-snapshot.sh
./node/install-snapshot.sh

echo -e "${yellow}--- Running Docker Tezos container${endColor}"
echo

TEZOS_VERSION="${TEZOS_VERSION}" TEZOS_HISTORY_MODE="${TEZOS_HISTORY_MODE}" docker-compose up -d

echo
echo -e "${green}✓ Node is running!${endColor}"
echo
