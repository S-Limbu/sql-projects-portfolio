-- 🧠 Problem: Find the top 5 customers who spent the most money overall.
-- 📚 Concepts: GROUP BY, SUM(), ORDER BY, LIMIT
-- 💡 Why this matters: Identifying top customers is key for sales strategy and customer retention.

SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- 🖼️ Screenshot: screenshots/02-top-customers-result.png
-- 📝 Output: List of top 5 customer IDs with total amount spent.
