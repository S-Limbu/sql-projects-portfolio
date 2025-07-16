# 🎯 Analysis: Identifying Registered Customers with No Orders

---

## 🧠 Business Scenario
The Operations Team needs to identify registered users who have never placed an order. This is a critical insight to support re-engagement campaigns and helps understand where in the user journey potential drop-off or friction occurs — especially after account creation.

## 💡 Why This Insight Matters

- Drives **re-engagement efforts** by targeting dormant or inactive users.

- Helps evaluate **conversion rates** from registration to actual purchase.

- Reveals **user experience issues** or onboarding gaps that prevent first-time purchases.

## 🧰 SQL Concepts Used

| Concept        | Purpose                                                             |
| -------------- | ------------------------------------------------------------------- |
| `LEFT JOIN`    | Combines all customers with any matching order (if exists)          |
| `NULL`         | Filters to find customers with **no matching orders** (i.e., NULLs) |
| `WHERE` clause | Targets customers where order data is missing (no purchases)        |

---

## 🧪 Query Logic Breakdown

```sql
SELECT c.id, c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;


What’s happening and why?

- We're keeping all records from the customers table (using LEFT JOIN) and pulling in matching orders (if they exist).

- If there is no match, the order.id will be NULL.

- The WHERE o.id IS NULL clause filters for those users who never made a purchase.

📊 Output Summary

| id | name    |
| -- | ------- |
| 3  | Dorothy |
| 4  | Quinn   |
| 6  | Charlie |
| 7  | Connor  |
| 9  | Sofia   |
| 10 | Morgan  |
| 11 | Dexter  |

These users signed up but have not placed any orders.

🔍 Business Insight
Roughly 7 out of 12 users (58%) registered but never completed a purchase. This insight suggests a potential problem in the conversion funnel — possibly poor onboarding, pricing issues, or lack of initial value shown. It allows marketing or product teams to target these users with onboarding fixes, tailored campaigns, or incentives to convert.

🔑 Takeaway
Over half of registered users haven’t converted — this presents a major opportunity for retention and re-engagement strategy.

