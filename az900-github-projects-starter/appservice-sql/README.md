# App Service + Azure SQL (PaaS)

**Goal:** Deploy a Linux App Service running a sample Node app and provision an Azure SQL database. Set the DB connection string as an app setting.

## Steps
1. `bash deploy.sh` — creates App Service plan + Web App + SQL server/db; deploys sample app via ZIP.
2. Script prints the web app URL. Visit it to verify the app is running.
3. (Optional) Connect your app code to SQL using the `SQLCONNSTR_DefaultConnection` setting.
4. `bash cleanup.sh` when done.

## What you learn
- PaaS web hosting vs. IaaS.
- App settings and deployment methods (zip deploy).
- Basic database provisioning and firewall rules.

## 📸 Screenshots

### 1) Setup
![Setup](./screenshots/Setup.png)

### 2) Make scripts executable
![Make scripts executable](./screenshots/Make%20scripts%20executable.png)

### 3) Deploy resources
![Deploy resources](./screenshots/Deploy%20resources.png)

### 4) Test in browser
![Test in browser](./screenshots/Test%20in%20browser.png)

### 5) Azure Portal – Resource Group
![Azure Portal – Resource Group](./screenshots/Azure%20Portal%20-%20Resource%20Group.png)

### 6) Azure Portal – Web App
![Azure Portal – Web App](./screenshots/Azure%20Portal%20_%20Web%20App.png)

### 7) Cleanup
![Cleanup](./screenshots/Cleanup.png)
