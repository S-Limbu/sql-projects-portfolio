- 🧠 Problem / Business Scenario: The E-commerce Pricing Team wants to identify premium-priced products, defined as any product priced above the average price of all products in the store.
This helps them plan marketing strategies like “premium bundles” or adjust any margins.
  
- 📚 Concepts: SUBQUERY + AVG
  
- 💡 Why this matters: Knowing which products are priced above average can:
  - Help categorize inventory into “budget,” “normal,” and “premium” tiers.
  - Influence discounting strategies and any upselling opportunities.
  - Support data-driven pricing decisions to help businesses stay competitive.
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS products;

-- 🧱 2. Create the table schema

CREATE TABLE products (
  id INT,
  name TEXT,
  price DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO products VALUES
(1, 'Headphones', 500),
(2, 'Tablet', 400),
(3, 'Laptop', 1000),
(4, 'Watch', 650),
(5, 'Kindle', 400),
(6, 'Playstation 5', 550),
(7, 'Xbox 360', 230),
(8, 'Guitar', 200),
(9, 'Storage Boxes', 120),
(10, 'DVD Player', 100);
  
-- 🔍 4. Final query

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 🖼️ Screenshot: screenshots/07-above-average-price-result.png
-- 📝 Output: Shows all products listed above "average" price.
