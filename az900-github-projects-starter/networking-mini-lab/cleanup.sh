#!/usr/bin/env bash
set -euo pipefail
RG="${RG:-rg-az900-net}"
echo "Deleting resource group $RG ..."
az group delete -n "$RG" --yes --no-wait
echo "Delete requested. Resources will be removed shortly."
