#!/usr/bin/env bash
set -euo pipefail

RG="${RG:-rg-az900-net}"
LOC="${LOC:-eastus}"
VNET="${VNET:-vnet-az900}"
SNET_FE="${SNET_FE:-snet-frontend}"
SNET_BE="${SNET_BE:-snet-backend}"
NSG_FE="${NSG_FE:-nsg-frontend}"
NSG_BE="${NSG_BE:-nsg-backend}"
VM_FE="${VM_FE:-vm-frontend}"
VM_BE="${VM_BE:-vm-backend}"
VM_SIZE="${VM_SIZE:-Standard_B1s}"

az group create -n "$RG" -l "$LOC" 1>/dev/null

# VNet + subnets
az network vnet create -g "$RG" -n "$VNET" --address-prefixes 10.20.0.0/16 \
  --subnet-name "$SNET_FE" --subnet-prefixes 10.20.1.0/24 1>/dev/null
az network vnet subnet create -g "$RG" --vnet-name "$VNET" -n "$SNET_BE" --address-prefixes 10.20.2.0/24 1>/dev/null

# NSGs
az network nsg create -g "$RG" -n "$NSG_FE" 1>/dev/null
az network nsg create -g "$RG" -n "$NSG_BE" 1>/dev/null

# Allow SSH inbound on both
for NSG in "$NSG_FE" "$NSG_BE"; do
  az network nsg rule create -g "$RG" --nsg-name "$NSG" -n allow-ssh --priority 1000 \
    --direction Inbound --access Allow --protocol Tcp --destination-port-ranges 22 1>/dev/null
done

# Allow HTTP inbound on backend only
az network nsg rule create -g "$RG" --nsg-name "$NSG_BE" -n allow-http --priority 1010 \
  --direction Inbound --access Allow --protocol Tcp --destination-port-ranges 80 1>/dev/null

# Associate NSGs
az network vnet subnet update -g "$RG" --vnet-name "$VNET" -n "$SNET_FE" --network-security-group "$NSG_FE" 1>/dev/null
az network vnet subnet update -g "$RG" --vnet-name "$VNET" -n "$SNET_BE" --network-security-group "$NSG_BE" 1>/dev/null

# VMs
az vm create -g "$RG" -n "$VM_FE" --image Ubuntu2204 --size "$VM_SIZE" \
  --admin-username azureuser --authentication-type ssh --generate-ssh-keys \
  --vnet-name "$VNET" --subnet "$SNET_FE" --public-ip-sku Standard --nsg "" 1>/dev/null

az vm create -g "$RG" -n "$VM_BE" --image Ubuntu2204 --size "$VM_SIZE" \
  --admin-username azureuser --authentication-type ssh --generate-ssh-keys \
  --vnet-name "$VNET" --subnet "$SNET_BE" --public-ip-sku Standard --nsg "" 1>/dev/null

# Install Nginx on backend VM
az vm run-command invoke -g "$RG" -n "$VM_BE" --command-id RunShellScript \
  --scripts "sudo apt-get update -y && sudo apt-get install -y nginx && sudo systemctl enable --now nginx" 1>/dev/null

PUB_FE=$(az vm show -d -g "$RG" -n "$VM_FE" --query publicIps -o tsv)
PUB_BE=$(az vm show -d -g "$RG" -n "$VM_BE" --query publicIps -o tsv)
PRI_BE=$(az vm show -d -g "$RG" -n "$VM_BE" --query privateIps -o tsv)

echo "----------------------------------------"
echo "Frontend VM public IP: $PUB_FE"
echo "Backend  VM public IP: $PUB_BE"
echo "Backend  VM private IP: $PRI_BE"
echo "Test: ssh azureuser@$PUB_FE  ->  curl http://$PRI_BE"
echo "When done: bash cleanup.sh"
