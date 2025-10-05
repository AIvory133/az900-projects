# 🚀 VM Webserver Lab (IaaS)

## 🎯 Goal
Deploy and host a web page from an Ubuntu Virtual Machine in Azure.  
Practice configuring NSG rules, installing software remotely, and verifying service access.

---

## ✅ Outcomes
By completing this lab, you will:

- Provision an **Ubuntu Linux VM** in an allowed region (`eastus2`).
- Configure **Network Security Group (NSG)** rules for HTTP (80) and SSH (22).
- Install and start **Nginx** using Azure CLI RunCommand.
- Verify public web access through the VM’s public IP.
- Clean up resources to avoid unnecessary costs.

---

## 📸 Screenshots
A walkthrough of the Azure VM Webserver Lab deployment.

### 1. Resource Group Overview  
Shows the **rg-az900-vm-eus2** resource group with the VM, NSG, NIC, and Public IP.

<img width="1677" height="751" alt="ResourceGroup" src="https://github.com/user-attachments/assets/6497edde-3b07-459d-8061-dc5f9f5eab96" />


---

### 2. Virtual Machine Overview  
Displays the VM status (**Running**), size (**Standard_B1s**), region, and **Public IP**.

<img width="1689" height="923" alt="VM-Overview" src="https://github.com/user-attachments/assets/8080e76c-660b-4aee-a296-904330ec0a21" />


---

### 3. NSG Inbound Rules  
Demonstrates NSG rules allowing inbound **HTTP (80)** and **SSH (22)** traffic.

<img width="1835" height="938" alt="NSG-Inbound-Rules" src="https://github.com/user-attachments/assets/6da784e9-ec08-49c1-ad9c-58df92bd23ce" />


---

### 4. Browser Homepage  
The deployed Nginx welcome page served from the VM at:  
`http://<your-public-ip>`

<img width="1558" height="512" alt="Browser-Nginx" src="https://github.com/user-attachments/assets/6c68510d-3537-4a84-8c1b-d8318934ff59" />


---

### 5. Deployment Output  
Terminal output showing successful script completion and public IP address.

<img width="1074" height="114" alt="Deployment-Output" src="https://github.com/user-attachments/assets/f81c660d-3e09-412f-ba20-34c6474497fd" />


---

### 6. Nginx Status (Optional)  
SSH into the VM to confirm the **Nginx** service is running.

<img width="1349" height="570" alt="Nginx-Status" src="https://github.com/user-attachments/assets/da586287-8791-48c5-a16b-ff034fc8cb2d" />


---

## 🧹 Cleanup
When you finish the lab, delete the resource group to avoid ongoing charges.  
This removes the VM, NSG, NIC, Public IP, and all related resources.

