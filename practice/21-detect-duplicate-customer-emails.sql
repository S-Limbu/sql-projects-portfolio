-- 🧠 Problem: 
-- 📚 Concepts: GROUP BY + HAVING + COUNT
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  customer_id INT,
  name TEXT,
  email TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO customers VALUES
(1, 'Alice', 'a@example.com'),
(2, 'Bob', 'b@example.com'),
(3, 'Alice Clone', 'a@example.com'),
(4, 'Charlie', 'c@example.com');

-- 🔍 4. Final query

SELECT email, COUNT(*) AS email_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- 🖼️ Screenshot: screenshots/21-detect-duplicate-customer-emails-result.png
-- 📝 Output: 
