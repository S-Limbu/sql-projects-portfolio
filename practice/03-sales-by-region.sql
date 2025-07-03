-- 🧠 Problem: Calculate total sales amount by region.
-- 📚 Concepts: GROUP BY + ORDER BY
-- 💡 Why this matters: Regional breakdowns help evaluate area-specific performance.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- 🧱 2. Create the table schema

CREATE TABLE sales (
  sale_id INT,
  region TEXT,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO sales VALUES
(1, 'North', 500),
(2, 'South', 700),
(3, 'North', 200),
(4, 'East', 400),
(5, 'South', 300);

-- 🔍 4. Final query

SELECT region, SUM(amount) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 🖼️ Screenshot: screenshots/03-sales-by-region-result.png
-- 📝 Output: Sales totals per region.
