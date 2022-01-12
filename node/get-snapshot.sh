#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

echo -e "${yellow}--- Pulling latest snapshot${endColor}"
echo

SNAPSHOT_URL=$(curl -sS https://snapshots-tezos.giganode.io | grep -o -E '"(https.*mainnet.*full)"' | tr -d '"' | head -1)

if [ ! -e ${TEZOS_PATH}/snapshots/mainnet.full ]; then
  mkdir -p ${TEZOS_PATH}/snapshots
  # Download latest snapshot from giganode.io
  curl -L ${SNAPSHOT_URL} -o ${TEZOS_PATH}/snapshots/mainnet.full
  echo
  echo -e "${green}✓ Done!${endColor}"
  echo
else
  echo -e "${green}✓ Snapshot already pulled!${endColor}"
  echo
fi
