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
- (Optional) Generate a **SAS token** for restricted access to blobs.
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

![Static Website Settings](screenshots/StaticWebsite_Settings.png)

---

### 3. `$web` Container
Uploaded site content (`index.html`, `404.html`) to the special `$web` container.

![Web Container](screenshots/WebContainer.png)

---

### 4. Browser Homepage
The deployed static site served from Azure Storage at  
`https://<your-storage-account>.z20.web.core.windows.net/`

![Browser Homepage](screenshots/Browser_Homepage.png)

---

### 5. Terminal Verification
Curl command showing **200 OK** response from the static site endpoint.

![Curl showing 200 OK](screenshots/Curl_OK.png)

