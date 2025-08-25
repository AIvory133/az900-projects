# AZ-900 Projects Starter

This repo contains hands-on labs that map to AZ-900 objectives. Each lab has:
- **Scripts** to deploy resources (Azure CLI).
- **Cleanup** script to delete the resource group.
- A **README** with steps, verification, and key takeaways.

> Prereqs: Azure account (free tier ok), Azure CLI, Git, and a GitHub account.

## Labs
1. `vm-webserver-lab` — VM + NSG + Nginx web server (IaaS).
2. `storage-static-site` — Azure Storage static website + SAS.
3. `appservice-sql` — App Service (Linux) + sample Node app + Azure SQL (PaaS).
4. `rbac-policy` — RBAC role assignment + Azure Policy restriction.
5. `cost-management` — Pricing Calculator, budgets, and tags (guide).
6. `networking-mini-lab` — Two subnets, two VMs, NSGs (VNet basics).

## Quick Start
```bash
# log in and pick a subscription
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"

# run any lab
cd vm-webserver-lab
bash deploy.sh
# ... verify ...
bash cleanup.sh  # IMPORTANT: avoid charges
```
