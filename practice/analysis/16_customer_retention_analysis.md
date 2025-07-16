## 🎯 Analysis: Identifying Churned vs. Retained Customers

---

## 🧠 Business Scenario
The Customer Success Team wants to classify each customer as either churned or retained. A churned customer is one who made only one purchase, while retained customers made multiple orders — suggesting continued engagement and loyalty.

---

## 💡 Why This Insight Matters

- **Retained customers** often have **higher lifetime value** and are more cost-effective to keep than acquiring new ones.

- Enables **personalized outreach** and **targeted marketing** campaigns.

- Supports customer segmentation into **high-engagement vs. low-engagement** groups.

---

## 🧰 SQL Concepts Used

| Concept     | Purpose                                                    |
| ----------- | ---------------------------------------------------------- |
| `COUNT(*)`  | Counts the number of orders per customer                   |
| `CASE WHEN` | Used to classify customer status (churned/retained)        |
| `GROUP BY`  | Groups orders by customer for aggregation                  |
| `ORDER BY`  | Sorts results to highlight most or least engaged customers |

---

## 🧪 Query Logic Breakdown

```sql
SELECT 
customer_id,
COUNT(*) AS total_orders,
CASE 
WHEN COUNT(*) = 1 THEN 'Churned'
ELSE 'Retained'
END AS status
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

What’s happening and why?

- COUNT(*) counts how many orders each customer placed.

- CASE WHEN COUNT(*) = 1 THEN 'Churned' classifies those with just one order as "Churned".

- ELSE 'Retained' flags customers with more than one order.

- GROUP BY customer_id aggregates orders per customer.

- ORDER BY total_orders DESC ranks customers by activity level — most active at the top.

📊 Output Summary

| customer\_id | total\_orders | status   |
| ------------ | ------------- | -------- |
| 101          | 6             | Retained |
| 102          | 2             | Retained |
| 103          | 1             | Churned  |
| 104          | 2             | Retained |
| 105          | 1             | Churned  |
| ...          | ...           | ...      |


🔍 Business Insight
The query cleanly separates customers based on their order frequency.

Customers like 101 and 102 are retained, showing long-term potential.

Customers like 103, 105, and 107 are churned, indicating potential drop-off.

🔑 Takeaway
Repeat buyers are retained — key targets for loyalty and upsell efforts; single-order users are at risk of churn.
