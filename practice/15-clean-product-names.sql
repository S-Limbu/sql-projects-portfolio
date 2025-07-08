- 🧠 Problem / Business Scenario: The Data Team is standardizing product names received from multiple suppliers. 
  The source data contains inconsistencies like extra spaces and inconsistent casing, which need to be cleaned
  before generating accurate reports.

- 📚 Concepts: LOWER + TRIM + REPLACE

- 💡 Why this matters: 
  - Ensures product names are standardized across the database, making analysis and reporting accurate.
  - Standardized fields make joins between datasets more reliable and efficient.
  - Ensures clean labels appear on reports and dashboards.
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS products;

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

-- 🖼️ Screenshot: screenshots/15-clean-product-names-result.png
-- 📝 Output: Data Cleaned it to look much cleaner and more convenient.
