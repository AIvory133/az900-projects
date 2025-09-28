# 🚀 Storage Static Website Lab (PaaS Storage)

[![Azure](https://img.shields.io/badge/Azure-Cloud-blue?logo=microsoft-azure)](https://azure.microsoft.com)
[![Category](https://img.shields.io/badge/Service-Storage%20Account-green)](https://learn.microsoft.com/azure/storage/blobs/storage-blob-static-website)
[![Level](https://img.shields.io/badge/Difficulty-Beginner-yellow)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey)]()

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

## ⚙️ Steps

1. **Deploy resources**
   ```bash
   bash ./deploy.sh --location eastus2 --resource-group rg-az900-storage-eus2
