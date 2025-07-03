-- 🧠 Problem: Get full customer names and their order totals.
-- 📚 Concepts: INNER JOIN, GROUP BY, Aggregation
-- 💡 Why this matters: Real-world reporting often requires combining data from multiple tables.

SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS full_name,
  SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, full_name;

-- 🖼️ Screenshot: screenshots/06-orders-customers-join-result.png
-- 📝 Output: Customer full names with their total spend.
