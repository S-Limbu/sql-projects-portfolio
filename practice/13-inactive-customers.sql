- 🧠 Problem / Business Scenario: The Operations Team wants to find out which registered customers have never placed an order. 
  This insight helps drive re-engagement campaigns or 
  understand potential user drop-off points after signup.
  
- 📚 Concepts: LEFT JOIN + NULL 
  
- 💡 Why this matters: This insight helps:
  - Drive re-engagement campaigns.
  - Knowing which users haven't converted helps measure how effectively signups turn into paying customers. (Marketing Analysis).
  - Understand potential user drop-off points after signup to figure effective solutions against this.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS orders, customers;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  id INT,
  name TEXT
);

CREATE TABLE orders (
  id INT,
  customer_id INT
);

-- 📊 3. Insert sample/mock data
  
INSERT INTO customers VALUES
(1, 'Alice'), (2, 'Diana'), (3, 'Dorothy'), (4, 'Quinn'), (5, 'Charles'), (6, 'Charlie')
, (7, 'Connor'), (8, 'Ashley'), (9, 'Sofia'), (10, 'Morgan'), (11, 'Dexter'),
(12, 'Luna');

INSERT INTO orders VALUES
(1, 1), (2, 2), (5, 5), (8, 8), (12,12);
  
-- 🔍 4. Final query

SELECT c.id, c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 🖼️ Screenshot: screenshots/13-inactive-customers-result.png
-- 📝 Output: Shows the inactive customers , this can be used to find the active customers to target marketing efforts towards.
