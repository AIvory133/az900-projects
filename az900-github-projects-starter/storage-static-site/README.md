# Storage Static Website Lab (PaaS Storage)

**Goal:** Host a static website from Azure Storage and practice SAS tokens.

## Steps
1. `bash deploy.sh` — prints the static website endpoint.
2. Visit the endpoint; you should see the included `index.html`.
3. Optional: generate a **SAS** for a blob and test restricted access.
4. `bash cleanup.sh` when done.

## What you learn
- Storage redundancy (LRS/GRS), static website hosting, containers vs. blobs.
- Public vs. SAS-based access.
