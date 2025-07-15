# 🎯 Analysis: Identifying Top 2 Highest-Spending Customers

---

## 🧠 Business Scenario

The Sales Team at a growing e-commerce company wants to **identify the top two highest-spending customers**. These individuals will be **invited to a loyalty rewards program** designed to encourage continued spending and strengthen customer relationships.

---

## 💼 Why This Insight Matters

High-spending customers typically generate **disproportionate revenue** and are crucial to the success of any growing business. By identifying them early, the company can:

- Launch **personalized marketing** campaigns tailored to their preferences.
- Offer **exclusive incentives** (e.g., early access to sales or VIP programs).
- Improve **customer retention** by making these users feel valued.

This approach ensures the business is not only acquiring customers — but keeping the most profitable ones engaged over time.

---

## 🧰 SQL Concepts Used

| Concept          | Purpose                                                                 |
|------------------|-------------------------------------------------------------------------|
| `JOIN`           | To combine customer names from the `customers` table with order data.   |
| `GROUP BY`       | To aggregate spend amounts per customer.                                |
| `SUM()`          | To calculate total amount each customer has spent.                      |
| `ORDER BY`       | To sort customers by their total spend in descending order.             |
| `LIMIT`          | To return only the top 2 customers based on spend.                      |

---

## 🧪 Query Logic Breakdown

```sql
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

Step 1: JOIN
We join the customers and orders tables to associate each order with a customer name.

Step 2: GROUP BY + SUM()
Grouping by c.name allows us to sum the amount field for each individual, resulting in their total spending.

Step 3: ORDER BY + LIMIT
We sort these totals in descending order and then limit the result to the top 2 customers only.

📊 Output Summary
Based on the inserted mock data:

| name | total\_spent |
| ---- | ------------ |
| Kim  | 550          |
| Rob  | 250          |

- Kim is the highest spender with £550.

- Rob is the second highest with £250.

- Both are strong candidates for the loyalty rewards program.

🔍 Business Insight
This query gives us a clear and simple snapshot of customer value based on spending. These two individuals are ideal targets for:

- Loyalty offers

- Feedback surveys

- Upsell opportunities

- Priority service or early-access programs

By maintaining visibility on top customers, the business can allocate marketing resources more efficiently, boosting retention and lifetime value.

✅ Takeaway
This analysis exemplifies how a straightforward SQL query can yield high-impact business insight. It bridges raw transaction data and strategic decision-making, forming the basis for customer segmentation and retention strategies.

🔑 Knowing who your best customers are is the first step to keeping them.
