#!/usr/bin/env bash
set -euo pipefail

# Scope: resource group or subscription
SCOPE_RG="${SCOPE_RG:-rg-az900-policy}"
LOC="${LOC:-eastus}"
POLICY_NAME="${POLICY_NAME:-allow-small-vm-sizes}"
DEF_DISPLAY="Allow only small VM sizes (B1s/B1ms)"
RULES_FILE="${RULES_FILE:-restrict-vm-size-policy.json}"

az group create -n "$SCOPE_RG" -l "$LOC" 1>/dev/null

SUB_ID=$(az account show --query id -o tsv)
SCOPE="/subscriptions/$SUB_ID/resourceGroups/$SCOPE_RG"

# Create policy definition at subscription level
az policy definition create \
  --name "$POLICY_NAME" \
  --display-name "$DEF_DISPLAY" \
  --rules "$RULES_FILE" \
  --mode All 1>/dev/null

# Assign at RG scope
az policy assignment create \
  --name "$POLICY_NAME" \
  --policy "$POLICY_NAME" \
  --scope "$SCOPE" 1>/dev/null

echo "Policy assigned at scope: $SCOPE"
echo "Try creating a VM with size D2s_v5 in $SCOPE_RG — it should be denied."
