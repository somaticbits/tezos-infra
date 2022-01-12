#!/bin/bash

source ./config/colors.sh
source ./config/config.sh

echo
echo -e "${yellow}*************************************************${endColor}"
echo -e "${yellow}* Welcome to SOMATICBITS's TzKT install script! *${endColor}"
echo -e "${yellow}*************************************************${endColor}"
echo
echo -e "${yellow}--- Cloning TzKT${endColor}"
echo

git clone https://github.com/baking-bad/tzkt.git ${TEZOS_PATH}/tzkt

echo
echo -e "${yellow}--- Removing existing installation${endColor}"
echo

cd ${TEZOS_PATH}/tzkt
make stop
make clean

echo
echo -e "${yellow}--- Initialising TzKT${endColor}"
echo

make init

echo
echo -e "${yellow}--- Starting TzKT${endColor}"
echo

make start
