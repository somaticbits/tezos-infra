#!/bin/bash

source ./config/colors.sh
source ./config/config.sh
source ./snapshot-config.sh

echo
echo -e "${yellow}--- Pulling latest snapshot${endColor}"
echo

if [ ! -e ${TEZOS_PATH}/snapshots/mainnet.full ]; then
  mkdir -p ${TEZOS_PATH}/snapshots
  # Download latest snapshot from giganode.io
  curl -L ${SNAPSHOT_URL} -o ${TEZOS_PATH}/snapshots/mainnet.full
else
  echo
  echo -e "${green}✓ Snapshot already pulled!${endColor}"
  echo
fi
