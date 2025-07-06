-- 🧠 Problem: 
-- 📚 Concepts: JOIN + GROUP BY + ORDER BY + SUM + SUBQUERIES + CTE + RANK + PARTITION BY 
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS transactions;

-- 🧱 2. Create the table schema

CREATE TABLE products (
  product_id INT,
  name TEXT,
  category TEXT
);

CREATE TABLE sales (
  sale_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO products VALUES
(1, 'Shirt', 'Clothing'),
(2, 'Pants', 'Clothing'),
(3, 'Phone', 'Electronics'),
(4, 'Laptop', 'Electronics');

INSERT INTO sales VALUES
(1, 1, 10, 20),
(2, 2, 5, 50),
(3, 3, 2, 500),
(4, 4, 1, 1000),
(5, 3, 3, 500);

-- 🔍 4. Final query

WITH product_revenue AS (
SELECT 
p.category,
p.name,
SUM(s.quantity * s.price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category, p.name
),
ranked AS (
SELECT *,
RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
FROM product_revenue
)
SELECT category, name AS best_product, revenue
FROM ranked
WHERE rnk = 1;


-- 🖼️ Screenshot: screenshots/20-best-selling-product-per-category-result.png
-- 📝 Output: 
