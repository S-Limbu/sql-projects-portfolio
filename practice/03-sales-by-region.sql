-- 🧠 Problem: Calculate total sales amount by region in the last 12 months.
-- 📚 Concepts: GROUP BY, WHERE, SUM(), DATE functions
-- 💡 Why this matters: Regional breakdowns help evaluate area-specific performance.

SELECT region, SUM(sales_amount) AS total_sales
FROM sales
WHERE sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 12 MONTH)
GROUP BY region;

-- 🖼️ Screenshot: screenshots/03-sales-by-region-result.png
-- 📝 Output: Sales totals per region over the past year.
