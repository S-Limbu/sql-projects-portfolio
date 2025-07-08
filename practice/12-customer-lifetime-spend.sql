- 🧠 Problem / Business Scenario: The Marketing Team wants to 
  understand how much each customer has spent in total since they first started purchasing. This metric is known as 
  Customer Lifetime Value and is key to customer segmentation and retention strategies.
  
- 📚 Concepts: SUM + GROUP BY
  
- 💡 Why this matters: This matters for numerous reasons as;
  - High-spending customers can receive exclusive deals and loyalty programs.
  - Identifying top spenders can help priotize customer retention to those that counts the most.
  - Grouping customers by total spend allows teams to tailor messaging and promotions effectively.
   
-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS customers;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  id INT,
  name TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO orders VALUES
(1, 1, 100), (2, 1, 200), (3, 2, 300);

-- 🔍 4. Final query

SELECT customer_id, SUM(amount) AS lifetime_spend
FROM orders
GROUP BY customer_id
ORDER BY lifetime_spend DESC;

-- 🖼️ Screenshot: screenshots/12-customer-lifetime-spend-result.png
-- 📝 Output: Showcases the most loyal customer that has spent the most all time in a list.
