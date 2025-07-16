# 🎯 Analysis: Classifying High vs Normal Value Orders

---

## 🧠 Business Scenario
The Finance and Sales Team wants to classify each order based on the purchase amount. Orders above £500 are marked as "High" value to flag them for special attention — such as fraud checks, premium support, or loyalty rewards.

---

## 💡 Why This Insight Matters

- Helps **prioritize high-value orders** for quicker shipping or manual verification.

- Allows teams to **target premium customers** with tailored incentives or loyalty programs.

- Improves reporting and dashboard clarity by **grouping orders into meaningful tiers**.

---

## 🧰 SQL Concepts Used

| Concept | Purpose                                                           |
| ------- | ----------------------------------------------------------------- |
| `CASE`  | Adds conditional logic to classify values into categories         |
| `ELSE`  | Provides a default classification for values not meeting criteria |

---

## 🧪 Query Logic Breakdown

```sql
SELECT *,
CASE 
WHEN amount > 500 THEN 'High'
ELSE 'Normal'
END AS value_flag
FROM orders;


What’s happening and why?

The CASE statement evaluates the amount in each order.

Orders with amounts greater than £500 are labeled 'High'.

All other orders are marked as 'Normal'.

This classification is added as a new column (value_flag) in the output.

📊 Output Summary

| id | customer\_id | amount | value\_flag |
| -- | ------------ | ------ | ----------- |
| 1  | 1            | 450    | Normal      |
| 2  | 2            | 600    | High        |
| 3  | 3            | 800    | High        |
| 4  | 4            | 200    | Normal      |
| 5  | 5            | 450    | Normal      |
| 6  | 6            | 780    | High        |
| 7  | 7            | 650    | High        |
| 8  | 8            | 100    | Normal      |
| 9  | 9            | 100    | Normal      |
| 10 | 10           | 770    | High        |

🔍 Business Insight
Out of 10 orders, 5 were classified as 'High' value. This shows that half the orders meet the premium threshold, giving the Sales and Finance teams a solid base of high-value customers to focus on for loyalty strategies, personalized follow-ups, and operational prioritization.

🔑 Takeaway
Half of all orders exceed £500 — making them prime targets for premium customer programs and operational prioritization.

