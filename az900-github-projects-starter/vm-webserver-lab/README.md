# VM Webserver Lab (IaaS)

**Goal:** Deploy an Ubuntu VM with an NSG, install Nginx, and serve a web page over HTTP.

## Steps
1. `bash deploy.sh` (set variables inside if you want to change names/region).
2. Wait ~2–4 minutes for deployment; the script prints the public IP.
3. Visit `http://<PUBLIC_IP>` in your browser — you should see the Nginx welcome page.
4. Optional: `ssh azureuser@<PUBLIC_IP>` and check `systemctl status nginx`.
5. `bash cleanup.sh` when done.

## What you learn
- VM sizes (B-series), NSG rules, public IPs, Azure metadata.
- Installing packages with `az vm run-command`.
- Basic cost awareness (delete RG).
