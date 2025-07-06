-- 🧠 Problem / Business Scenario: The Product Team wants to identify the most frequently sold products to better nderstand
which items performing well and should be promoted more heavily or stocked up.
-- 📚 Concepts: COUNT + GROUP BY + ORDER BY
-- 💡 Why this matters: Helps businesses know which products are most popular.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE sales (
  sale_id INT,
  product_name TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO sales VALUES
(1, 'Phone'),
(2, 'Laptop'),
(3, 'Phone'),
(4, 'Tablet'),
(5, 'Phone'),
(6, 'Laptop');

-- 🔍 4. Final query

SELECT product_name, COUNT(*) AS count_sold
FROM sales
GROUP BY product_name
ORDER BY count_sold DESC;

-- 🖼️ Screenshot: screenshots/04-most-common-products-result.png
-- 📝 Output: Top 3 product IDs by frequency of purchase.
