-- 🧠 Problem: 
-- 📚 Concepts: CTE + RANK + PARTITION BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS customers
DROP TABLE IF EXISTS orders;

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
(4, 'Laptop', '2023-02-15', 4);

-- 🔍 4. Final query

WITH monthly_sales AS (
  SELECT DATE_TRUNC('month', sale_date) AS month,
         product,
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

-- 🖼️ Screenshot: screenshots/0.png
-- 📝 Output: 
