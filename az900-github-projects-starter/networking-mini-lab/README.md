# Networking Mini-Lab (VNet, Subnets, NSGs)

**Goal:** Build a VNet with two subnets (frontend, backend), place a VM in each, and control traffic with NSGs.

## Steps
1. `bash deploy.sh` — creates VNet/subnets, NSGs, two Ubuntu VMs, and installs Nginx on backend.
2. The script prints both public and private IPs.
3. (Manual test) SSH into the **frontend** VM, then curl the **backend** private IP: `curl http://<backend-private-ip>`.
4. (Optional) Tighten NSG rules to only allow HTTP from frontend subnet to backend.
5. `bash cleanup.sh` when done.

## What you learn
- Subnetting, NSG scopes, and basic east-west traffic.
