#!/bin/bash

# RPC config
TEZOS_VERSION="v12.0-rc1_7a8c3312_20211220191531"
TEZOS_HISTORY_MODE="${TEZOS_HISTORY_MODE:-full}"
TEZOS_PATH="/tezos"
RPC_URL="t-node.somaticbits.xyz"
RPC_PORT=8732 # default port

# Grafana + Prometheus config
MONITOR_URL="testmonitor.somaticbits.xyz"
MONITOR_PORT=3000 # default port

# TzKT config
TZKT_URL="t-tzkt.somaticbits.xyz"
TZKT_PORT=5000 # default port

# Certbot config
CERTBOT_EMAIL="pestpockenkrew@hotmail.com"
