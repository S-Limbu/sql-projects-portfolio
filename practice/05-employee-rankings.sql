-- 🧠 Problem: Rank employees based on total salary.
-- 📚 Concepts: Window Functions (RANK), ORDER BY
-- 💡 Why this matters: Salary evaluation to see who's getting paid however much.

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE employees (
  id INT,
  name TEXT,
  salary INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO employees VALUES
(1, 'Alice', 70000),
(2, 'Bob', 90000),
(3, 'Charlie', 90000),
(4, 'Dana', 60000);

-- 🔍 4. Final query

SELECT name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 🖼️ Screenshot: screenshots/05-employee-rankings-result.png
-- 📝 Output: Each employee's rank in terms of their salary.
