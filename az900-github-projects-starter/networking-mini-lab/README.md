# 🌐 Networking Mini-Lab (VNet, Subnets, NSGs)

[![Azure](https://img.shields.io/badge/Azure-CLI-blue?logo=microsoft-azure)](https://learn.microsoft.com/en-us/cli/azure/)
[![Category](https://img.shields.io/badge/Domain-Networking-orange)]()
[![Status](https://img.shields.io/badge/Project-Completed-brightgreen)]()

---

## 🎯 Goal
Deploy a simple Azure networking lab to understand:
- Subnetting
- Network Security Group (NSG) scopes
- East-west traffic between VMs

---

## 🏗️ Architecture
- **Resource Group:** `rg-networking-mini-lab`  
- **Virtual Network (VNet):** `vnet-lab (10.10.0.0/16)`  
  - **Frontend Subnet:** `sn-frontend (10.10.1.0/24)`  
  - **Backend Subnet:** `sn-backend (10.10.2.0/24)`  
- **NSGs:**
  - `nsg-frontend`: allow SSH from my IP → frontend  
  - `nsg-backend`: allow HTTP (80) only from frontend subnet  
- **VMs:**
  - `vm-frontend5` (Ubuntu 22.04, public IP via `pip-frontend2`)  
  - `vm-backend` (Ubuntu 22.04, private IP only, runs Nginx)  

---

## 📸 Evidence

### 1. Azure Portal — Resource Group Overview
Shows all deployed resources: VNet, NSGs, NICs, VMs, and Public IPs.  
<img width="1906" height="887" alt="Resource group overview" src="https://github.com/user-attachments/assets/bbb8b282-2dd0-4649-bad4-d1f05412f16a" />


---

### 2. Azure Portal — VNet Subnets
Frontend (10.10.1.0/24) and Backend (10.10.2.0/24).  
<img width="1895" height="878" alt="Subnets" src="https://github.com/user-attachments/assets/87bbc458-ce65-41e5-99f6-6f8f51ef9636" />


---

### 3. Azure Portal — NSG Frontend Inbound Rules
Allows SSH from my public IP to the frontend VM.  
<img width="1905" height="883" alt="nsg-frontend inbound rule" src="https://github.com/user-attachments/assets/7af744da-1c0c-435b-bcb8-7182436f7c4a" />


---

### 4. Azure Portal — NSG Backend Inbound Rules
Allows HTTP (80) only from the frontend subnet.  
<img width="1906" height="920" alt="nsg-backend inbound rules" src="https://github.com/user-attachments/assets/aa589142-b2a9-49d0-9e0e-353e40067164" />


---

### 5. Terminal — SSH into Frontend VM
Successful login showing private IP `10.10.1.5`.  
<img width="645" height="617" alt="SSH to vm-frontend5 (10 10 1 5)" src="https://github.com/user-attachments/assets/3b7040f8-ad15-4f8b-9e70-96e9f93903aa" />


---

### 6. Terminal — Curl to Backend VM
Frontend VM curls backend private IP (10.10.2.4) and receives Nginx HTML.  
<img width="631" height="734" alt="From frontend, curl the backend and show headers + HTML" src="https://github.com/user-attachments/assets/0ac17aee-b2e7-4cb4-9748-707739410617" />


---

## ✅ Outcomes
- Verified frontend VM can reach backend VM over private IP.  
- Confirmed NSGs restrict backend traffic to **frontend-only**.  
- Practiced troubleshooting issues like PIP quotas, NIC conflicts, and NSG bindings.  

---

## 🧹 Cleanup
```bash
az group delete -n rg-networking-mini-lab --yes --no-wait
