#!/usr/bin/env bash
set -euo pipefail

RG="${RG:-rg-az900-storage}"
LOC="${LOC:-eastus}"
SUFFIX=$(head -c 4 /dev/urandom | od -An -tx1 | tr -d ' \n')
STORAGE="staz900${SUFFIX}"

echo "Using RG=$RG LOC=$LOC STORAGE=$STORAGE"

az group create -n "$RG" -l "$LOC" 1>/dev/null

az storage account create \
  -g "$RG" -n "$STORAGE" -l "$LOC" --sku Standard_LRS --kind StorageV2 1>/dev/null

# Enable static website
az storage blob service-properties update \
  --account-name "$STORAGE" \
  --static-website --index-document index.html 1>/dev/null

# Upload site
az storage blob upload \
  --account-name "$STORAGE" \
  --container-name '$web' \
  --file index.html \
  --name index.html \
  --only-show-errors 1>/dev/null

endpoint=$(az storage account show -g "$RG" -n "$STORAGE" --query "primaryEndpoints.web" -o tsv)
echo "----------------------------------------"
echo "Static site endpoint: $endpoint"
echo "When done: bash cleanup.sh"
