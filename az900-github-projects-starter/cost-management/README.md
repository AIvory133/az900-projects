# Cost Management Lab (Budgets & Calculator)

**Goal:** Estimate costs for resources you deployed and set a budget/alert.

## Part A — Pricing Calculator (Portal)
1. Go to https://azure.microsoft.com/pricing/calculator/.
2. Add **Virtual Machine** (B1s, Linux), **Storage Account** (LRS), and **App Service (B1)**.
3. Choose your region and 730 hours/month for always-on resources.
4. Export or screenshot your estimate and save it in this folder.

## Part B — Budgets (Portal)
1. Azure Portal → **Cost Management + Billing** → **Budgets** → **Add**.
2. Scope: your subscription (or a resource group).
3. Set a **monthly** budget and add **email alerts** at 50%, 80%, 100% thresholds.
4. Save, then view the **Cost analysis** blade to observe spend over a few days of lab use.

## Optional — Tags and Cost Analysis
- Add a tag `project=az900` to your resource groups.
- Use **Cost Management** to filter by tag and see per-project costs.
