# RBAC + Azure Policy Lab (Governance)

**Goal:** Assign a Reader role to a user at resource group scope and restrict VM sizes with a Policy.

## Steps
1. Create/choose a **resource group** you want to govern.
2. `bash assign-policy.sh` — defines a policy that *allows only small VM sizes* (B1s/B1ms) at the RG scope.
3. Try creating a VM with a larger size (e.g., D2s_v5) — it should be **denied**.
4. For RBAC, in the Azure Portal (or CLI), assign **Reader** to a test user at the RG.
5. `bash cleanup.sh` to remove the policy definition/assignment.

> Note: For RBAC CLI, you'd typically need a second AAD user. You can still practice via Portal if that's easier.

## What you learn
- Difference between **governance** (Policy) and **access control** (RBAC).
- Scope and inheritance.
