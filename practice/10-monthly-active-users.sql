-- 🧠 Problem: 
-- 📚 Concepts:  DATE_TRUNC + COUNT DISTINCT + GROUP BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE logins (
  user_id INT,
  login_date DATE
);

-- 📊 3. Insert sample/mock data

INSERT INTO logins VALUES
(1, '2023-01-01'),
(1, '2023-01-15'),
(2, '2023-01-20'),
(3, '2023-02-05'),
(1, '2023-02-10');

-- 🔍 4. Final query

SELECT DATE_TRUNC('month', login_date) AS month,
       COUNT(DISTINCT user_id) AS active_users
FROM logins
GROUP BY month
ORDER BY month;

-- 🖼️ Screenshot: screenshots/10-monthly-active-users-result.png
-- 📝 Output: 
