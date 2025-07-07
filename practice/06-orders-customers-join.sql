- 🧠 Problem / Business Scenario: The Customer Success Team needs a report that shows each order along with the customer name who placed it,
  so they can prepare for upcoming support calls and personalize communication.
  
- 📚 Concepts: JOINS
  
- 💡 Why this matters: Real-world reporting often requires combining data from multiple tables, it helps teams;
  - Understand which customer made which purchases.
  - Helps track customers orders by client name (etc).
  - Provides context during customer service inquries.
    
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS employees;

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

-- 📝 Output: Customer names with their total spend are joined.
