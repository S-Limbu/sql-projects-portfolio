- 🧠 Problem / Business Scenario: The Sales Team at a growing e-commerce company wants to identify the top 2 
highest-spending customers, so that they can be invited to an upcoming loyalty rewards program.
  
- 📚 Concepts: JOINS + GROUP BY + ORDER BY + LIMIT
  
- 💡 Why this matters: Loyal, high-value customers are crucial for long-term revenue. Understanding who they are helps the company:
  - Personalized marketing efforts.
  - Offers exclusive incentives. 
  - Improves customer retention / loyalty.
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  amount DECIMAL
);

CREATE TABLE customers (
  id INT,
  name TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO customers VALUES
(1, 'Rob'), (2, 'Kim'), (3, 'Cam');

INSERT INTO orders VALUES
(101, 1, 100),
(102, 2, 250),
(103, 1, 150),
(104, 3, 75),
(105, 2, 300);

-- 🔍 4. Final query

SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

-- 🖼️ Screenshot: screenshots/02-top-customers-result.png
-- 📝 Output: Received the top 2 customers that spend the most money and are eligable for the loyalty program.
