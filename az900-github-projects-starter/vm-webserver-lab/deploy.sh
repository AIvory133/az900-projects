#!/usr/bin/env bash
set -euo pipefail

# ---------- Config ----------
RG="${RG:-rg-az900-vm}"
LOC="${LOC:-eastus}"
VMNAME="${VMNAME:-vmweb01}"
VNET="${VNET:-vnet-az900}"
SUBNET="${SUBNET:-snet-web}"
NSG="${NSG:-nsg-web}"
VM_SIZE="${VM_SIZE:-Standard_B1s}"

echo "Using RG=$RG LOC=$LOC VM=$VMNAME SIZE=$VM_SIZE"

# ---------- Resource group ----------
az group create -n "$RG" -l "$LOC" 1>/dev/null

# ---------- Networking ----------
az network vnet create \
  -g "$RG" -n "$VNET" --address-prefixes 10.10.0.0/16 \
  --subnet-name "$SUBNET" --subnet-prefixes 10.10.1.0/24 1>/dev/null

az network nsg create -g "$RG" -n "$NSG" 1>/dev/null
# Allow SSH (22) and HTTP (80)
az network nsg rule create -g "$RG" --nsg-name "$NSG" -n allow-ssh --priority 1000 \
  --direction Inbound --access Allow --protocol Tcp --destination-port-ranges 22 1>/dev/null
az network nsg rule create -g "$RG" --nsg-name "$NSG" -n allow-http --priority 1010 \
  --direction Inbound --access Allow --protocol Tcp --destination-port-ranges 80 1>/dev/null

# Associate NSG to subnet
az network vnet subnet update -g "$RG" --vnet-name "$VNET" -n "$SUBNET" --network-security-group "$NSG" 1>/dev/null

# ---------- VM ----------
az vm create \
  -g "$RG" -n "$VMNAME" --image Ubuntu2204 \
  --size "$VM_SIZE" \
  --admin-username azureuser \
  --authentication-type ssh \
  --generate-ssh-keys \
  --vnet-name "$VNET" --subnet "$SUBNET" \
  --public-ip-sku Standard \
  --nsg "" 1>/dev/null

# Install Nginx
az vm run-command invoke -g "$RG" -n "$VMNAME" \
  --command-id RunShellScript \
  --scripts "sudo apt-get update -y && sudo apt-get install -y nginx && sudo systemctl enable --now nginx" 1>/dev/null

PUBLIC_IP=$(az vm show -d -g "$RG" -n "$VMNAME" --query publicIps -o tsv)
echo "----------------------------------------"
echo "Deployed! Visit: http://$PUBLIC_IP"
echo "To SSH: ssh azureuser@$PUBLIC_IP"
echo "When done: bash cleanup.sh"
