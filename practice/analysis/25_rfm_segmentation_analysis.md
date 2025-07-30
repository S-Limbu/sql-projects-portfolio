# 🎯 Analysis: RFM Segmentation for Customer Value

---

## 🧠 Problem / Business Scenario
You work as a Customer Insights Analyst for an e-commerce company.
The Marketing team wants to **segment users based on their Recency, Frequency, and Monetary value (RFM)**.

The goal is to: Reward loyal, high-spending customers, Re-engage those who haven’t shopped in a while ,Identify patterns among regular or occasional buyers.
You need to **build a customer segmentation model using RFM metrics** derived from order history.

---

## 💡 Why This Matters

- Focuses **outreach and incentives on the right segments**

- Helps **retain high-value customers** while reducing churn

- RFM is a **proven strategy for increasing CLV** (Customer Lifetime Value)

---

## 🧰 SQL Concepts Used

| Concept                     | Purpose                                            |
| --------------------------- | -------------------------------------------------- |
| `CTE`                       | Used to pre-calculate per-customer metrics         |
| `MAX()`                     | Captures the most recent order date for Recency    |
| `COUNT()`                   | Calculates the number of purchases (Frequency)     |
| `SUM()`                     | Total amount spent (Monetary value)                |
| `CURRENT_DATE - last_order` | Measures how many days ago the last order occurred |
| `CASE WHEN`                 | Categorizes customers into strategic segments      |

---

## 🧪 Query Logic Breakdown

```sql
WITH rfm AS (
  SELECT 
    customer_id,
    MAX(order_date) AS last_order,
    COUNT(*) AS frequency,
    SUM(amount) AS monetary
  FROM orders
  GROUP BY customer_id
)
SELECT 
  customer_id,
  CURRENT_DATE - last_order AS recency_days,
  frequency,
  monetary,
  CASE 
    WHEN frequency >= 2 AND monetary > 200 THEN 'Top Customer'
    WHEN frequency = 1 AND monetary < 150 THEN 'Low Value'
    ELSE 'Regular'
  END AS segment
FROM rfm;


What’s happening and why?

- CTE to group order data by customer.

- MAX(order_date) → Last purchase date → used for Recency

- COUNT(*) → Number of purchases → used for Frequency

- SUM(amount) → Total spend → used for Monetary

- In the final SELECT, we compute days since last purchase using CURRENT_DATE - last_order.

- A CASE statement classifies customers into three meaningful segments:

- Top Customer: Active and high-spending

- Low Value: Single purchase, low spend

- Regular: Everyone else

📊 Sample Output

| customer\_id | recency\_days | frequency | monetary | segment      |
| ------------ | ------------- | --------- | -------- | ------------ |
| 101          | 526           | 2         | 250      | Top Customer |
| 108          | 473           | 1         | 210      | Regular      |
| 103          | 454           | 3         | 1230     | Top Customer |
| 104          | 490           | 1         | 210      | Regular      |
| 105          | 478           | 2         | 640      | Top Customer |
| 107          | 454           | 3         | 890      | Top Customer |
| 102          | 456           | 3         | 1180     | Top Customer |
| 109          | 466           | 1         | 160      | Regular      |
| 106          | 486           | 1         | 280      | Regular      |
| 110          | 460           | 1         | 290      | Regular      |

🔍 Business Insight

- Send VIP rewards to “Top Customers”

- Build win-back campaigns for users inactive 

- Offer coupons or bundles to regular but medium-value customers

🔑 Takeaway
RFM segmentation is one of the simplest yet most powerful ways to identify value in your customer base.
This query provides the foundation for:
Lifecycle marketing, Retargeting, Customer lifetime value modeling and campaign prioritization.
