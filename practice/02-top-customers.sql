-- 🧠 Problem: 
-- 📚 Concepts: 
-- 💡 Why this matters: Identifying top customers is key for sales strategy and customer retention.

SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

-- 🖼️ Screenshot: screenshots/02-top-customers-result.png
-- 📝 Output: 

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  amount DECIMAL
);

CREATE TABLE customers (
  id INT,
  name TEXT
);

INSERT INTO customers VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, 100),
(102, 2, 250),
(103, 1, 150),
(104, 3, 75),
(105, 2, 300);
