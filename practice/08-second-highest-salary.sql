-- 🧠 Problem: Find the second highest salary.
-- 📚 Concepts: DISTINCT, ORDER BY, LIMIT, OFFSET
-- 💡 Why this matters: Return second-highest salary (if exists)

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
(1, 'Alice', 70000),
(2, 'Bob', 90000),
(3, 'Charlie', 80000);

-- 🔍 4. Final query

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 LIMIT 1;

-- 🖼️ Screenshot: screenshots/08-second-highest-salary-result.png
-- 📝 Output: 
