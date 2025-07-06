-- 🧠 Problem: 
-- 📚 Concepts: COUNT + DISTINCT + GROUP BY + ORDER BY
-- 💡 Why this matters: 

-- 🔄 1. Drop existing table to avoid conflicts

DROP TABLE IF EXISTS revenue;

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
(5, 'visit'), (5, 'signup');

-- 🔍 4. Final query

SELECT event,
COUNT(DISTINCT user_id) AS users
FROM funnel
GROUP BY event
ORDER BY users DESC;

-- 🖼️ Screenshot: screenshots/18-conversion-funnel-result.png
-- 📝 Output: 
