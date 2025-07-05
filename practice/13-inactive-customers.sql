-- 🧠 Problem: 
-- 📚 Concepts: LEFT JOIN + NULL 
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  id INT,
  name TEXT
);

CREATE TABLE orders (
  id INT,
  customer_id INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO customers VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO orders VALUES
(1, 1), (2, 2);

-- 🔍 4. Final query

SELECT c.id, c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 🖼️ Screenshot: screenshots/0.png
-- 📝 Output: 
