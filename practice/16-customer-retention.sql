- 🧠 Problem/Business Scenario: The Customer Success Team wants to identify which customers are churned vs. retained. 
A customer who has only made one order is considered churned, while repeat customers are marked as retained.
  
- 📚 Concepts: COUNT + CASE + WHEN + THEN + ELSE + GROUP BY + ORDER BY
  
- 💡 Why this matters: 
  - Retained customers usually have a higher lifetime value. Knowing who they are helps with upselling and targeted marketing.
  - Customer retention is a key KPI — it’s often cheaper to retain a customer than acquire a new one.
  - Helps categorize users into high- and low-engagement groups for personalized outreach.
  
-- 🔄 1. Drop existing table to avoid conflicts
  
DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  order_date DATE,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 101, '2024-01-05', 100),
(2, 102, '2024-01-06', 200),
(3, 103, '2024-01-07', 300),
(4, 101, '2024-02-10', 150),
(5, 104, '2024-03-01', 120),
(6, 105, '2024-03-15', 180),
(7, 102, '2024-04-01', 220),
(8, 101, '2024-05-01', 90),
(9, 106, '2024-05-01', 90),
(10, 106, '2024-05-01', 110),
(11, 107, '2024-05-01', 190),
(12, 104, '2024-05-01', 230),
(13, 108, '2024-05-01', 120),
(14, 108, '2024-05-01', 60),
(15, 109, '2024-05-01', 80),
(16, 109, '2024-05-01', 70),
(17, 110, '2024-05-01', 240),
(18, 101, '2024-05-01', 230),
(19, 101, '2024-05-01', 150),
(20, 101, '2024-05-01', 90);

-- 🔍 4. Final query

SELECT 
customer_id,
COUNT(*) AS total_orders,
CASE WHEN COUNT(*) = 1 THEN 'Churned'
ELSE 'Retained'
END AS status
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 🖼️ Screenshot: screenshots/16-customer-retention-result.png
-- 📝 Output: Found customers who are considered 'churned'.
