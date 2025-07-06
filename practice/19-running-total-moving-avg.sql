-- 🧠 Problem: 
-- 📚 Concepts: SUM() OVER + AVG() OVER + ROUND + ROWS BETWEEN + CURRENT ROW + ORDER BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS funnel;

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
(5, '2024-01-05', 300);

-- 🔍 4. Final query

SELECT 
transaction_date,
amount,
SUM(amount) OVER (ORDER BY transaction_date) AS running_total,
ROUND(AVG(amount) OVER (ORDER BY transaction_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3d
FROM transactions;

-- 🖼️ Screenshot: screenshots/19-running-total-moving-avg-result.png
-- 📝 Output: 
