#!/bin/bash
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
endColor=$'\e[0m'

source ./config.sh

echo -e "${yellow}--- Importing snapshot (will take a while... be patient)${endColor}"
echo

SNAPSHOT_URL=$(curl -sS https://snapshots-tezos.giganode.io | grep -o -E '"(https.*mainnet.*full)"' | tr -d '"' | head -1)

# Extract block id from snapshot URL for import
BLOCK_ID=$(echo "$SNAPSHOT_URL" | grep -o -P '(?<=[0-9]_)(.*?)(?=.full)')
docker run --rm -v ${TEZOS_PATH}/node:/var/run/tezos/node \
                -v ${TEZOS_PATH}/snapshots/mainnet.full:/snapshot \
                tezos/tezos:${TEZOS_VERSION} \
                tezos-snapshot-import --block=${BLOCK_ID}

echo
echo -e "${green}✓ Done!${endColor}"
echo
