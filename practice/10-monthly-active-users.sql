- 🧠 Problem / Business Scenario: The Analytics Team wants to calculate Monthly Active Users (MAU) — 
the number of unique users who logged into the platform each month — to monitor engagement trends and app usage.
  
- 📚 Concepts:  DATE_TRUNC + COUNT DISTINCT + GROUP BY
  
- 💡 Why this matters: Tracking MAUs is crucial for:
  - Understanding user retention and churn
  - Reporting growth to stakeholders or investors
  - Identifying seasonal patterns and usage spikes
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS logins;

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
-- 📝 Output: Shows MAU
