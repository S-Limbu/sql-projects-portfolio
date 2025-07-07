-🧠 Problem / Business Scenario: HR is conducting a salary analysis to identify where employees rank in terms of salary.
  
-📚 Concepts: Window Functions (RANK) + ORDER BY
  
-💡 Why this matters: Ranking employees based on salary allows;
 - Fair and transparent compensation planning.
 - Identification of top earners for potential leadership pipelines.
 - Spotting outliers (underpaid or overpaid roles) to correct any unfair salaries.
   
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS sales;

-- 🧱 2. Create the table schema

CREATE TABLE employees (
  id INT,
  name TEXT,
  salary INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO employees VALUES
(1, 'Sam', 70000),
(2, 'Rob', 90000),
(3, 'Melissa', 90000),
(4, 'Diana', 60000),
(5, 'Michael', 60000),
(6, 'Cane', 85000),
(7, 'Bob', 86700),
(8, 'Daniel', 40400),
(9, 'Tyler', 50000);

-- 🔍 4. Final query

SELECT name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 🖼️ Screenshot: screenshots/05-employee-rankings-result.png
-- 📝 Output: Each employee's rank in terms of their salary.
