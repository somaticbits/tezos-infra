#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

echo
echo -e "${yellow}************************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's Tezos full node install script! *${endColor}"
echo -e "${yellow}************************************************************${endColor}"
echo
echo -e "${yellow}--- Pulling Tezos Docker image${endColor}"
echo

docker pull tezos/tezos:${TEZOS_VERSION}

echo
echo -e "${yellow}--- Creating folders for permanent storage${endColor}"
echo

mkdir -p ${TEZOS_PATH}/node
chmod 777 ${TEZOS_PATH}/node
mkdir -p ${TEZOS_PATH}/snapshots

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo -e "${yellow}--- Pulling latest snapshot${endColor}"
echo

# Download latest snapshot from giganode.io
SNAPSHOT_URL=$(curl -sS https://snapshots-tezos.giganode.io | grep -o -E '"(https.*mainnet.*full)"' | tr -d '"' | head -
1)
curl -L ${SNAPSHOT_URL} -o ${TEZOS_PATH}/snapshots/mainnet.full

echo
echo -e "${green}✓ Done!${endColor}"
echo

echo -e "${yellow}--- Running Docker Tezos container and importing snapshot (will take a while... be patient)${endColor}"
echo

# Extract block id from snapshot URL for import
BLOCK_ID=$(echo "$SNAPSHOT_URL" | grep -o -P '(?<=[0-9]_)(.*?)(?=.full)')
docker run --rm -v ${TEZOS_PATH}/node -v ${TEZOS_PATH}/snapshots/mainnet.full tezos/tezos:${TEZOS_VERSION} tezos-snapshot-import --block=${BLOCK_ID}

echo
echo -e "${green}✓ Done!${endColor}"
echo
