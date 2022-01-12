#!/bin/bash

source ./config/colors.sh
source ./config/config.sh
source ./snapshot-config.sh

echo -e "${yellow}--- Importing snapshot (will take a while... be patient)${endColor}"
echo

docker run --rm -v ${TEZOS_PATH}/node:/var/run/tezos/node \
                -v ${TEZOS_PATH}/snapshots/mainnet.full:/snapshot \
                tezos/tezos:${TEZOS_VERSION} \
                tezos-snapshot-import --block=${BLOCK_ID}

echo
echo -e "${green}✓ Done!${endColor}"
echo
