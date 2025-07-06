-- 🧠 Problem: 
-- 📚 Concepts: DATE_TRUNC + SUM + LAG() + ROUND
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS employees;

-- 🧱 2. Create the table schema

CREATE TABLE revenue (
  order_id INT,
  order_date DATE,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO revenue VALUES
(1, '2024-01-05', 100),
(2, '2024-01-15', 200),
(3, '2024-02-10', 300),
(4, '2024-03-12', 250),
(5, '2024-03-25', 300),
(6, '2024-04-01', 400);

-- 🔍 4. Final query
SELECT 
DATE_TRUNC('month', order_date) AS month,
SUM(amount) AS monthly_revenue,
LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS previous_month,
ROUND(
(SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date))) * 100.0
/ LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)), 2
) AS mom_growth_percent
FROM revenue
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- 🖼️ Screenshot: screenshots/17-monthly-revenue-growth.result.png
-- 📝 Output: 
