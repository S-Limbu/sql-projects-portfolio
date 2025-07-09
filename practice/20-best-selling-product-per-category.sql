- 🧠 Problem / Business Scenario: You’re a Retail Analyst working for a multi-category retailer. 
The company wants to identify the best-selling product by revenue in each category to make informed marketing strategies.
  
- 📚 Concepts: JOIN + GROUP BY + ORDER BY + SUM + SUBQUERIES + CTE + RANK + PARTITION BY 
  
- 💡 Why this matters: 
  - Category-level insights help optimize stock and promotions for top performers.
  - Enables targeted marketing by focusing on the most profitable products.
  - Identifies product trends to support forecasting and strategic planning.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS products, sales;

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
(4, 'Laptop', 'Electronics'),
(5, 'Tablet', 'Electronics'),
(6, 'Pens', 'Stationary'),
(7, 'Hoodie', 'Clothing'),
(8, 'Shoes', 'Clothing'),
(9, 'Notebook', 'Stationary'),
(10, 'iPod', 'Electronics'),
(11, 'Pencil', 'Stationary'),
(12, 'Chips', 'Food');

INSERT INTO sales VALUES
(1, 1, 10, 20),
(2, 2, 5, 50),
(3, 3, 2, 500),
(4, 4, 1, 1000),
(5, 4, 3, 500),
(6, 12, 1, 10),
(7, 10, 11, 10),
(8, 2, 12, 50),
(9, 9, 8, 15),
(10, 3, 5, 200),
(11, 5, 1, 10),
(12, 8, 3, 20),
(13, 11, 9, 20),
(14, 12, 2, 50),
(15, 6, 4, 120),
(16, 7, 19, 100);

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
-- 📝 Output: Showcases the best product from each category and how much revenue they bring in.
