-- 🧠 Problem: Find the 3 most commonly purchased products.
-- 📚 Concepts: COUNT(), GROUP BY, ORDER BY
-- 💡 Why this matters: Helps businesses know which products are most popular.

SELECT product_id, COUNT(*) AS times_purchased
FROM order_items
GROUP BY product_id
ORDER BY times_purchased DESC
LIMIT 3;

-- 🖼️ Screenshot: screenshots/04-most-common-products-result.png
-- 📝 Output: Top 3 product IDs by frequency of purchase.
