-- 🧠 Problem: You work for an e-commerce company. You want to identify which customers are retained 
(made more than one purchase) and which have churned (only bought once).
-- 📚 Concepts: COUNT + CASE + WHEN + THEN + ELSE + GROUP BY + ORDER BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS employees;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  order_date DATE,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 101, '2024-01-05', 100),
(2, 102, '2024-01-06', 200),
(3, 103, '2024-01-07', 300),
(4, 101, '2024-02-10', 150),
(5, 104, '2024-03-01', 120),
(6, 105, '2024-03-15', 180),
(7, 102, '2024-04-01', 220),
(8, 101, '2024-05-01', 90);

-- 🔍 4. Final query

SELECT 
customer_id,
COUNT(*) AS total_orders,
CASE WHEN COUNT(*) = 1 THEN 'Churned'
ELSE 'Retained'
END AS status
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 🖼️ Screenshot: screenshots/16-customer-retention-result.png
-- 📝 Output: 
-- This portfolio challenge identifies customer retention using simple logic.
-- Any customer with only 1 order is considered "Churned".
-- Anyone with more than 1 order is "Retained".
-- A CASE statement is used to label each customer.
-- This simulates how businesses track customer loyalty or lifetime value.
