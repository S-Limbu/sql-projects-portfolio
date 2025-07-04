-- 🧠 Problem: Find products priced above average
-- 📚 Concepts: SUBQUERY + AVG
-- 💡 Why this matters: Shows products that are listed more expensive than average which can be used for marketing fields.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS employees;

-- 🧱 2. Create the table schema

CREATE TABLE products (
  id INT,
  name TEXT,
  price DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO products VALUES
(1, 'Phone', 500),
(2, 'Tablet', 400),
(3, 'Laptop', 1000);

-- 🔍 4. Final query

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 🖼️ Screenshot: screenshots/07-above-average-price-result.png
-- 📝 Output: Shows that "Laptop" is classified to be above average price.
