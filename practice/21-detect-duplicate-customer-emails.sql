- 🧠 Problem / Business Scenario: You work for an e-commerce company that collects customer details at checkout or sign-up.
The CRM system has flagged some customers that may have duplicate email addresses in the database—potentially due to 
multiple signups or poor data validation.
  
- 📚 Concepts: GROUP BY + HAVING + COUNT
  
- 💡 Why this matters: 
  - Duplicate emails can indicate dirty or duplicate records. This affects reporting, customer service, and personalization.
  - Email campaigns might be sent multiple times to the same user, wasting resources or annoying the customer.
  - Duplicate emails may suggest attempts to exploit promotions or discounts by signing up with variations of the same account.

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS customers;

-- 🧱 2. Create the table schema

CREATE TABLE customers (
  customer_id INT,
  name TEXT,
  email TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO customers VALUES
(1, 'Diana', 'd@example.com'),
(2, 'Bob', 'b@example.com'),
(3, 'Alice Clone', 'a@example.com'),
(4, 'Ray Lin', 'r@example.com'),
(5, 'Sam', 's@example.com'),
(6, 'Bobby', 'b@example.com'),
(7, 'Charlie', 'c@example.com'),
(8, 'Samantha', 's@example.com'),
(9, 'Diana', 'd@example.com'),
(10, 'Ronald', 'r@example.com'),
(11, 'Samuel', 's@example.com'),
(12, 'Frank', 'f@example.com'),
(13, 'Robert', 'r@example.com'),
(14, 'Cameron', 'c@example.com'),
(15, 'Ray', 'r@example.com');

-- 🔍 4. Final query

SELECT email, COUNT(*) AS email_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- 🖼️ Screenshot: screenshots/21-detect-duplicate-customer-emails-result.png
-- 📝 Output: All potential duplicate emails have been flagged.
