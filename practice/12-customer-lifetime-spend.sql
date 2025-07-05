-- 🧠 Problem: 
-- 📚 Concepts: SUM + GROUP BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  id INT,
  name TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 1, 100), (2, 1, 200), (3, 2, 300);

-- 🔍 4. Final query

SELECT customer_id, SUM(amount) AS lifetime_spend
FROM orders
GROUP BY customer_id;

-- 🖼️ Screenshot: screenshots/.png
-- 📝 Output: 
