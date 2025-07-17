# 🎯 Analysis: Month-over-Month Revenue Growth Tracking

---

## 🧠 Business Scenario
The Finance Team wants to analyze monthly revenue trends to understand Month-over-Month (MoM) growth. This helps guide decisions related to sales forecasting, budgeting, and marketing investments.

---

## 💡 Why This Insight Matters

- Helps identify **upward or downward** trends in revenue to take proactive action.

- MoM growth is a **standard KPI** for investors and stakeholders in financial reporting.

- Useful in assessing the **impact of marketing campaigns** or seasonal promotions.

---

## 🧰 SQL Concepts Used

| Concept      | Purpose                                                            |
| ------------ | ------------------------------------------------------------------ |
| `DATE_TRUNC` | Groups dates by month to aggregate monthly revenue.                |
| `SUM`        | Calculates the total revenue for each month.                       |
| `LAG()`      | Retrieves the previous month’s revenue for comparison.             |
| `ROUND()`    | Rounds MoM percentage change to 2 decimal places for presentation. |

---

# 🧪 Query Logic Breakdown

```sql
SELECT 
DATE_TRUNC('month', order_date) AS month,
SUM(amount) AS monthly_revenue,
LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS previous_month,
ROUND(
    (SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date))) * 100.0
    / LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)), 2
  ) AS mom_growth_percent
FROM revenue
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


What’s happening and why?

- DATE_TRUNC('month', order_date): Extracts the month from each order_date to group all sales into monthly buckets.

- SUM(amount): Adds up all sales amounts per month, giving us the monthly revenue.

- LAG(SUM(amount)) OVER (...): Retrieves the revenue from the previous month to enable MoM comparisons.

- MoM Growth Calculation:
(Current Month - Previous Month) / Previous Month * 100
This formula returns the percentage change in revenue between months. The use of ROUND(..., 2) ensures the value is clean and presentation-ready.

- ORDER BY month ensures that results appear chronologically for clarity.

📊 Output Summary

| month      | monthly\_revenue | previous\_month | mom\_growth\_percent |
| ---------- | ---------------- | --------------- | -------------------- |
| 2024-01-01 | 300              | NULL            | NULL                 |
| 2024-02-01 | 300              | 300             | 0.0                  |
| 2024-03-01 | 550              | 300             | 83.33                |
| ...        | ...              | ...             | ...                  |


🔍 Business Insight
The business can now track revenue momentum easily. For example, if April shows a high spike, leadership might investigate campaign effectiveness or seasonality. Declines might prompt intervention in customer retention or sales.

🔑 Takeaway
Month-over-month revenue tracking reveals how fast the business is growing or slowing, helping guide future actions and investment decisions.
