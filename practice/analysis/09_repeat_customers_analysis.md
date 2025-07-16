# 🎯 Analysis: Identifying Repeat Customers for Loyalty Campaigns

---

## 🧠 Business Scenario
The Marketing Analytics Team wants to identify customers who have made more than one purchase. These repeat customers are seen as valuable for loyalty initiatives and personalized re-engagement campaigns aimed at boosting retention and Customer Lifetime Value.

---

## 💡 Why This Insight Matters

- Helps **target repeat buyers** with exclusive loyalty offers and rewards.

- Supports **customer retention strategies** by focusing on the most engaged users.

- Enables **lifetime value modeling**, which influences long-term marketing spend and communication frequency.

## 🧰 SQL Concepts Used

| Concept      | Purpose                                                                   |
| ------------ | ------------------------------------------------------------------------- |
| `CTE (WITH)` | Structures a temporary result set to improve readability and reuse        |
| `COUNT(*)`   | Tallies the number of orders per customer                                 |
| `GROUP BY`   | Groups orders by customer to aggregate order counts                       |
| `WHERE`      | Filters only those customers with more than 1 order (i.e., repeat buyers) |


## 🧪 Query Logic Breakdown

```sql
WITH order_counts AS (
  SELECT customer_id, COUNT(*) AS num_orders
  FROM orders
  GROUP BY customer_id
)
SELECT *
FROM order_counts
WHERE num_orders > 1;


What’s happening and why?

- A CTE (WITH order_counts) is used to first count how many orders each customer has placed.

- Then, the main query selects only customers with more than one order using WHERE num_orders > 1.

- This results in a clean, modular breakdown of the logic, improving readability and maintainability of the SQL.

📊 Output Summary

Based on the sample data:

| customer\_id | num\_orders |
| ------------ | ----------- |
| 1            | 2           |
| 3            | 3           |

These two customers are considered repeat buyers.

🔍 Business Insight
Customers with multiple purchases are strong candidates for loyalty programs and upselling opportunities. In this case, Customer 1 and Customer 3 have shown repeated engagement with the business, making them ideal targets for:

- Reward tiers

- Email personalization

- Early access promotions

🔑 Takeaway
Two repeat customers were identified — prime candidates for loyalty programs and targeted marketing efforts to increase retention and maximize revenue.
