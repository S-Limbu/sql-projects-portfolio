-- 🧠 Problem: 
-- 📚 Concepts: CASE + ELSE
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS logins;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  id INT,
  customer_id INT,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 1, 450), (2, 2, 600), (3, 3, 800);

-- 🔍 4. Final query

SELECT *,
       CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS value_flag
FROM orders;

-- 🖼️ Screenshot: screenshots/11-flag-value-orders-result.png
-- 📝 Output: 
