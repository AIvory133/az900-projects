# 💰 Cost Management Lab (Budgets & Calculator)

## 🎯 Goal
Use the Azure Pricing Calculator to estimate costs for common resources and configure a budget with alerts to track and control spending.

---

## 📝 Part A — Pricing Calculator
1. Open the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/).
2. Add the following resources:
   - **Virtual Machine** → B1s (Linux), 730 hours/month (always on).
   - **Storage Account** → LRS (Locally Redundant Storage).
   - **App Service** → Basic (B1).
3. Select your region (e.g., *East US*).
4. Configure each resource for pay-as-you-go.
5. Export or screenshot your estimate.

📸 **Screenshot:**  
- `/screenshots/Calculator.png`

---

## 📝 Part B — Budgets
1. In the **Azure Portal**:  
   `Cost Management + Billing → Budgets → +Add`.
2. **Scope:** Subscription (or Resource Group).
3. **Reset period:** Monthly  
4. **Budget amount:** $50  
5. Add **email alerts** at:
   - 50% (actual)
   - 80% (forecasted)
   - 100% (actual)
6. Save the budget.
7. Navigate to **Cost analysis** to view accumulated cost over time.

## 📝 Part A — Pricing Calculator
📸 **Screenshot:**
<img width="1518" height="827" alt="Calculater Estimate" src="https://github.com/user-attachments/assets/da634c5c-ea8b-42de-88e4-b591ab3c27f8" />


## 📝 Part B — Budgets
📸 **Screenshots:**
<img width="1434" height="939" alt="Budget Overview" src="https://github.com/user-attachments/assets/db900ee1-5090-4d73-a953-c1117c17a5b7" />

<img width="1893" height="943" alt="Cost Analysis" src="https://github.com/user-attachments/assets/38995940-8803-4834-a4a6-42ecc1886a9f" />

