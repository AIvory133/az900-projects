# RBAC + Azure Policy Lab (Governance)

## 🎯 Goal
Assign a **Reader** role at the resource group scope and enforce a **Policy** that restricts VM sizes to only **Standard_B1s** and **Standard_B1ms**.

---

## 🚀 Lab (One Big Step)
In this lab, you create a resource group, define and assign a custom policy, test both a denied and an allowed VM deployment, assign the Reader RBAC role, capture screenshots for proof, and finally clean everything up. Start by creating a resource group in a supported region such as `eastus2`, then immediately define a custom policy called `allowed-vm-sizes-b-only` that denies VM sizes other than B1s/B1ms, and assign it at the resource group scope. After the policy is applied, test enforcement by attempting to deploy a disallowed VM size (Standard_D2s_v5) which should fail with a `RequestDisallowedByPolicy` error, and then deploy an allowed VM size (Standard_B1s) which should succeed. Next, demonstrate RBAC by assigning the **Reader** role to a test user at the same resource group scope. Throughout this process, capture proof: the Policy Assignment page in the portal, the deny error from the CLI showing `policyDefinitionName: allowed-vm-sizes-b-only`, the successful VM deployment output for vm-allow-test, and the IAM role assignment showing Reader. When the lab is complete, clean up by deleting the resource group, policy assignment, and policy definition so no resources are left behind.

---

## 📘 What You Learn
- **Governance (Policy):** restricts *what* resources can be deployed.  
- **RBAC (Access Control):** restricts *who* can act.  
- **Scope & Inheritance:** both apply at subscription, resource group, or resource level and flow down.  

---

## 📂 Proof Locations
- Policy Assignment → <img width="1874" height="608" alt="policy-assignment" src="https://github.com/user-attachments/assets/73a522b8-25fb-4670-8518-fd0b4944dbb3" />
)  
- Deny Proof → <img width="1900" height="1059" alt="vm-deny" src="https://github.com/user-attachments/assets/2cd74541-91b8-4509-968e-875a0f44ce90" />
)  
- Allow Proof → <img width="939" height="178" alt="vm-allow" src="https://github.com/user-attachments/assets/6483dea4-189c-429a-a7c8-b8c74d490c33" />
)  
- IAM Reader Role → <img width="1485" height="818" alt="iam-reader" src="https://github.com/user-attachments/assets/638d9298-eee4-4777-8a9f-2a8208c06646" />
)  

`  

