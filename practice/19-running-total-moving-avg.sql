- 🧠 Problem / Business Scenario: You’re a Financial Analyst working at a tech company. Your manager wants to analyze 
daily cash flow and understand the cumulative revenue up to each date, alongside the 3-day moving average of transaction
amounts to identify any trends.
  
- 📚 Concepts: SUM() OVER + AVG() OVER + ROUND + ROWS BETWEEN + CURRENT ROW + ORDER BY
  
- 💡 Why this matters: 
  - Understand how revenue is building over time.
  - Quickly spot days that deviate sharply from recent performance.
  - Basis for trend forecasting and sales pacing for stakeholders.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS transactions;

-- 🧱 2. Create the table schema

CREATE TABLE transactions (
  transaction_id INT,
  transaction_date DATE,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO transactions VALUES
(1, '2024-01-01', 100),
(2, '2024-01-02', 200),
(3, '2024-01-03', 150),
(4, '2024-01-04', 180),
(5, '2024-01-05', 300),
(6, '2024-01-06', 490),
(7, '2024-01-07', 500),
(8, '2024-01-08', 300),
(9, '2024-01-09', 200),
(10, '2024-01-10', 210),
(11, '2024-01-11', 320),
(12, '2024-01-12', 340),
(13, '2024-01-13', 400),
(14, '2024-01-14', 450);

-- 🔍 4. Final query

SELECT 
transaction_date,
amount,
SUM(amount) OVER (ORDER BY transaction_date) AS running_total,
ROUND(AVG(amount) OVER (ORDER BY transaction_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3d
FROM transactions;

-- 🖼️ Screenshot: screenshots/19-running-total-moving-avg-result.png
-- 📝 Output: Shows the cumulative revenue overtime. An example of what’s expected in financial reporting and BI dashboards.


