#!/bin/bash

# RPC config
TEZOS_VERSION="v12.0-rc1"
TEZOS_HISTORY_MODE="${TEZOS_HISTORY_MODE:-full}"
TEZOS_PATH="/tezos"
RPC_URL="testnode.somaticbits.xyz"
RPC_PORT=8732 # default port

# Grafana + Prometheus config
MONITOR_URL="testmonitor.somaticbits.xyz"
MONITOR_PORT=3000 # default port

# TzKT config
TZKT_URL="testtzkt.somaticbits.xyz"
TZKT_PORT=5000 # default port
