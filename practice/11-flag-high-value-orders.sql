- 🧠 Problem / Business Scenario: The Finance and Sales Team wants to classify each order as either "High" or "Normal" 
based on the amount of purchases. Orders over £500 are considered high-value and may require special handling or a follow-up.

- 📚 Concepts: CASE + ELSE

- 💡 Why this matters: 
  - Segment orders for priority shipping or fraud checks.
  - Target high-value customers with loyalty programs.
  - Simplify dashboards by grouping order tiers.
  
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders;

-- 🧱 2. Create the table schema

CREATE TABLE orders (
  id INT,
  customer_id INT,
  amount DECIMAL
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 1, 450), (2, 2, 600), (3, 3, 800), ( 4, 4, 200), ( 5, 5, 450), 
( 6, 6, 780), ( 7, 7, 650), ( 8, 8, 100), ( 9, 9, 100), ( 10, 10, 770 );

-- 🔍 4. Final query

SELECT *,
CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS value_flag
FROM orders;

-- 🖼️ Screenshot: screenshots/11-flag-value-orders-result.png
-- 📝 Output: Seperates the value of orders to see which customers are spending more amounts of money for varius future
programs.
