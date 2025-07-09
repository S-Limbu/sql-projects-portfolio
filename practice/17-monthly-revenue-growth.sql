- 🧠 Problem / Business Scenario: The Finance Team wants to analyze the monthly revenue trends
to understand the month-over-month growth to make strategic decisions for sales, marketing, and resource planning.
  
- 📚 Concepts: DATE_TRUNC + SUM + LAG() + ROUND
  
- 💡 Why this matters: 
  - Helps identify upward or downward trends in revenue to make proactive decisions.
  - MOM growth is a standard metric used in reports, investor decks, and stakeholder presentations.
  - Understanding revenue growth by month helps assess the effectiveness of promotions or seasonal campaigns.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS revenue;

-- 🧱 2. Create the table schema

CREATE TABLE revenue (
  order_id INT,
  order_date DATE,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO revenue VALUES
(1, '2024-01-05', 100),
(2, '2024-01-15', 200),
(3, '2024-02-10', 300),
(4, '2024-03-12', 250),
(5, '2024-03-25', 300),
(6, '2024-04-01', 400),
(7, '2024-04-02', 390),
(8, '2024-04-26', 550),
(9, '2024-05-01', 500),
(10, '2024-05-10', 290),
(11, '2024-06-01', 330),
(12, '2024-06-22', 210),
(13, '2024-06-26', 470),
(14, '2024-07-01', 150),
(15, '2024-07-22', 250);

-- 🔍 4. Final query
SELECT 
DATE_TRUNC('month', order_date) AS month,
SUM(amount) AS monthly_revenue,
LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS previous_month,
ROUND(
(SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date))) * 100.0
/ LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)), 2
) AS mom_growth_percent
FROM revenue
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- 🖼️ Screenshot: screenshots/17-monthly-revenue-growth.result.png
-- 📝 Output: Shows the trend of growth.
