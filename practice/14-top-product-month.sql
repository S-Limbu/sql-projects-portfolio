- 🧠 Problem / Business Scenario: The Sales Team wants to understand the top-selling product for each month
  based on quantity sold. This helps with demand forecasting, inventory planning, and marketing decisions.
  
- 📚 Concepts: CTE + RANK + PARTITION BY
  
- 💡 Why this matters: 
  - Knowing which products sell best each month helps manage stock levels efficiently and reduce overstock/shortage.
  - Helps identify product performance and seasonal spikes to prepare accordingly.
  - Continuous monitoring of top performers helps guide R&D, bundling strategies, and future launches.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE sales (
  id INT,
  product TEXT,
  sale_date DATE,
  quantity INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO sales VALUES
(1, 'Phone', '2023-01-05', 3),
(2, 'Tablet', '2023-01-10', 2),
(3, 'Phone', '2023-02-01', 5),
(5, 'Laptop', '2023-02-15', 4),
(6, 'Laptop', '2023-02-17', 7),
(7, 'Tablet', '2023-02-18', 9),
(8, 'Phone', '2023-02-18', 2),
(9, 'Phone', '2023-03-15', 4),
(10, 'Laptop', '2023-03-15', 3),
(11, 'Tablet', '2023-03-15', 2),
(12, 'Laptop', '2023-03-15', 6),
(13, 'Laptop', '2023-03-15', 5);

-- 🔍 4. Final query

WITH monthly_sales AS (
SELECT DATE_TRUNC('month', sale_date) AS month, product,
SUM(quantity) AS total_quantity
FROM sales
GROUP BY month, product
),
ranked AS (
SELECT *,
RANK() OVER (PARTITION BY month ORDER BY total_quantity DESC) AS rnk
FROM monthly_sales
)
SELECT * FROM ranked
WHERE rnk = 1;

-- 🖼️ Screenshot: screenshots/14-top-product-month-result.png
-- 📝 Output: Found the top perfoming products of each month.
