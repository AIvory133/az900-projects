#!/usr/bin/env bash
set -euo pipefail

RG="${RG:-rg-az900-app}"
LOC="${LOC:-eastus}"
PLAN="${PLAN:-plan-az900}"
APP="${APP:-webapp-az900-$RANDOM}"
SQLSERVER="${SQLSERVER:-sqlaz900$RANDOM}"
SQLDB="${SQLDB:-sqldbaz900}"
ADMINUSER="${ADMINUSER:-sqladminuser}"
ADMINPASS="${ADMINPASS:-$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16)}"

echo "Using RG=$RG LOC=$LOC APP=$APP SQLSERVER=$SQLSERVER"

az group create -n "$RG" -l "$LOC" 1>/dev/null

# App Service (Linux, Basic plan)
az appservice plan create -g "$RG" -n "$PLAN" --is-linux --sku B1 1>/dev/null
az webapp create -g "$RG" -p "$PLAN" -n "$APP" --runtime "NODE:18-lts" 1>/dev/null

# Azure SQL (allow Azure services + current client IP)
az sql server create -g "$RG" -n "$SQLSERVER" -l "$LOC" -u "$ADMINUSER" -p "$ADMINPASS" 1>/dev/null
az sql server firewall-rule create -g "$RG" -s "$SQLSERVER" -n AllowAzureServices --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0 1>/dev/null
MYIP=$(curl -s https://api.ipify.org || echo "0.0.0.0")
az sql server firewall-rule create -g "$RG" -s "$SQLSERVER" -n ClientIP --start-ip-address "$MYIP" --end-ip-address "$MYIP" 1>/dev/null
az sql db create -g "$RG" -s "$SQLSERVER" -n "$SQLDB" --service-objective Basic 1>/dev/null

# Set connection string (app code does not use it by default; for demo)
CONN="Server=tcp:$SQLSERVER.database.windows.net,1433;Initial Catalog=$SQLDB;Persist Security Info=False;User ID=$ADMINUSER;Password=$ADMINPASS;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
az webapp config connection-string set -g "$RG" -n "$APP" \
  --settings DefaultConnection="$CONN" --connection-string-type=SQLAzure 1>/dev/null

# Zip deploy the sample app
zip -qr app.zip package.json sample-app
az webapp deployment source config-zip -g "$RG" -n "$APP" --src app.zip 1>/dev/null

URL="https://${APP}.azurewebsites.net"
echo "----------------------------------------"
echo "App deployed: $URL"
echo "SQL admin: $ADMINUSER  password: $ADMINPASS"
echo "When done: bash cleanup.sh"
