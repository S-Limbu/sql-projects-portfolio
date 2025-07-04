-- 🧠 Problem: Join orders with customer names.
-- 📚 Concepts: JOINS
-- 💡 Why this matters: Real-world reporting often requires combining data from multiple tables.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  id INT,
  name TEXT
);

CREATE TABLE orders (
  id INT,
  customer_id INT,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO customers VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, 200),
(102, 2, 300),
(103, 3, 150);

-- 🔍 4. Final query

SELECT o.id AS order_id, c.name AS customer_name, o.amount
FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- 🖼️ Screenshot: screenshots/06-orders-customers-join-result.png
-- 📝 Output: Customer names with their total spend.
