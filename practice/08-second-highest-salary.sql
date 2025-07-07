- 🧠 Problem: The HR Team wants you to identify the second-highest salary in the company. 
  This is part of an analysis to understand pay distribution and to create more competitive salary bands.
  
- 📚 Concepts: DISTINCT + ORDER BY + LIMIT + OFFSET
  
- 💡 Why this matters: Finding the second highest salary allows us to;
  - Benchmark compensation structures.
  - Evaluate gaps between employees.
  - Prevent outliers or unfair compensation gaps;
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS products;

-- 🧱 2. Create the table schema

CREATE TABLE employees (
  id INT,
  name TEXT,
  salary INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO employees VALUES
(1, 'Kai', 70000),
(2, 'Ray', 90000),
(3, 'Bart', 80000),
(4, 'Ryan', 65000),
(5, 'Kiera', 88000),
(6, 'Chanel', 92000),
(7, 'Caitlin', 67400),
(8, 'Charlie', 52000),
(9, 'Sophie', 80000);

-- 🔍 4. Final query

SELECT name, salary
FROM employees
WHERE salary = (
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 LIMIT 1
);

-- 🖼️ Screenshot: screenshots/08-second-highest-salary-result.png
-- 📝 Output: Shows that Ray is the second highest earner with a salary of '90000'.
