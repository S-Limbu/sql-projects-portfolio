-- 🧠 Problem: Rank employees based on total sales within each department.
-- 📚 Concepts: Window Functions (RANK), PARTITION BY, ORDER BY
-- 💡 Why this matters: Performance evaluation at the department level.

SELECT
  employee_id,
  department,
  SUM(sales) AS total_sales,
  RANK() OVER (PARTITION BY department ORDER BY SUM(sales) DESC) AS dept_rank
FROM employee_sales
GROUP BY employee_id, department;

-- 🖼️ Screenshot: screenshots/05-employee-rankings-result.png
-- 📝 Output: Each employee's rank within their department based on sales.
