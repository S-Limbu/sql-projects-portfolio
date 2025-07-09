- 🧠 Problem / Business Scenario: You work as a Product Analyst for an e-commerce app. 
The product team wants to understand how users are progressing through key steps in the user journey:  
 - Visiting the site
 - Signing up
 - Making a purchase
They need a quick snapshot of how many unique users completed each stage of the funnel.
  
- 📚 Concepts: COUNT + DISTINCT + GROUP BY + ORDER BY
  
- 💡 Why this matters: 
  - Helps detect where in the journey most users are falling off.
  - Gives insight into how well the product design or onboarding process is working.
  - Marketing ROI - Connects paid traffic (visits) to final sales (purchases).

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS funnel;

-- 🧱 2. Create the table schema

CREATE TABLE funnel (
  user_id INT,
  event TEXT
);

-- 📊 3. Insert sample/mock data

INSERT INTO funnel VALUES
(1, 'visit'), (1, 'signup'), (1, 'purchase'),
(2, 'visit'), (2, 'signup'),
(3, 'visit'), (3, 'signup'), (3, 'purchase'),
(4, 'visit'),
(5, 'visit'), (5, 'signup'),
(6, 'visit'), (6, 'signup'), (6, 'purchase'),
(7, 'visit'),
(8, 'visit'), (8, 'signup'), (8, 'purchase'),
(9, 'visit'), (9, 'signup'), 
(10, 'visit'), (10, 'signup'), (10, 'purchase'),
(11, 'visit'), 
(12, 'visit'), 
(13, 'visit'), (13, 'signup'), (13, 'purchase'),
(14, 'visit'), 
(15, 'visit'), (15, 'signup'), (15, 'purchase'),
(16, 'visit'), (16, 'signup'), (16, 'purchase'),
(17, 'visit'), (17, 'signup'), (17, 'purchase'),
(18, 'visit'), (18, 'signup'), 
(19, 'visit'), (19, 'signup'), (19, 'purchase');

-- 🔍 4. Final query

SELECT event,
COUNT(DISTINCT user_id) AS users
FROM funnel
GROUP BY event
ORDER BY users DESC;

-- 🖼️ Screenshot: screenshots/18-conversion-funnel-result.png
-- 📝 Output: Gathered the information needed to see where users typically stop in the 3 step process.
