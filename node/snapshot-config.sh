#!/bin/bash

SNAPSHOT_URL=$(curl -sS https://snapshots-tezos.giganode.io | grep -o -E '"(https.*mainnet.*full)"' | tr -d '"' | head -1)

# Extract block id from snapshot URL for import
BLOCK_ID=$(echo "$SNAPSHOT_URL" | grep -o -P '(?<=[0-9]_)(.*?)(?=.full)')
