-- 🧠 Problem: 
-- 📚 Concepts: LOWER + TRIM + REPLACE
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE products (
  id INT,
  raw_name TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO products VALUES
(1, '  PHONE '),
(2, 'Phone'),
(3, 'phone'),
(4, 'Tablet'),
(5, 'tablet ');

-- 🔍 4. Final query

SELECT id,
       raw_name,
       LOWER(TRIM(raw_name)) AS clean_name
FROM products;

-- 🖼️ Screenshot: screenshots/0.png
-- 📝 Output: 
