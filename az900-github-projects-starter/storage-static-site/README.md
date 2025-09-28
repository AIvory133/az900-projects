# 🚀 Storage Static Website Lab (PaaS Storage)



---

## 🎯 Goal
Deploy and host a **static website** from an **Azure Storage account** and practice using **Shared Access Signatures (SAS)** for secure, time-limited access.

---

## ✅ Outcomes
By completing this lab, you will:
- Provision a **StorageV2 account** in an allowed region (`eastus2`).
- Enable **Static Website** hosting on Azure Storage.
- Upload an `index.html` and optional `404.html` page into the `$web` container.
- Verify public access through the static website endpoint.
- Clean up resources to avoid unnecessary costs.

---

## 📸 Screenshots

A walkthrough of the **Azure Storage Static Website Lab** deployment.

---

### 1. Resource Group Overview
Shows the `rg-az900-storage-eus2` resource group with the storage account inside.

<img width="1885" height="672" alt="Resource Group Overview" src="https://github.com/user-attachments/assets/47122d34-0dfd-46eb-b10e-b4bf955ab6ee" />


---

### 2. Static Website Settings
Static website hosting enabled with `index.html` and `404.html` configured.

<img width="1900" height="866" alt="Static Website Settings" src="https://github.com/user-attachments/assets/10c0ddc6-2e7e-40ed-b6ef-5d9b03b4d3fb" />


---

### 3. `$web` Container
Uploaded site content (`index.html`, `404.html`) to the special `$web` container.

<img width="1894" height="591" alt="$web Contatiner" src="https://github.com/user-attachments/assets/ea084c95-d2eb-42c1-be48-c3881ad3af1b" />


---

### 4. Browser Homepage
The deployed static site served from Azure Storage at  
`https://<your-storage-account>.z20.web.core.windows.net/`

<img width="1915" height="625" alt="Browser Homepage" src="https://github.com/user-attachments/assets/8b8d8c0f-9ab8-4e39-8ee3-ea8518253df0" />


---

### 5. Terminal Verification
Curl command showing **200 OK** response from the static site endpoint.

<img width="1308" height="515" alt="Terminal Verification" src="https://github.com/user-attachments/assets/20cd9889-d15d-4bc3-baa5-ad3f76d1ffaf" />


