- 🧠 Problem / Business Scenario:The Marketing Analytics Team wants to identify repeat customers. 
These customers are ideal for loyalty rewards and personalized campaigns.
  
- 📚 Concepts: CTE + COUNT + GROUP BY
  
- 💡 Why this matters: Understanding who your repeat buyers are, is crucial for:
  - Targeted retention and re-engagement strategies.
  - Loyalty program qualification.
  - Estimating Customer Lifetime Value.
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  order_id INT,
  customer_id INT
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 1), (2, 1), (3, 2), (4, 3), (5, 3), (6, 3);

-- 🔍 4. Final query

WITH order_counts AS (
  SELECT customer_id, COUNT(*) AS num_orders
  FROM orders
  GROUP BY customer_id
)
SELECT *
FROM order_counts
WHERE num_orders > 1;

-- 🖼️ Screenshot: screenshots/09-repeat-customers-result.png
-- 📝 Output: Shows those that are repeat customers.
