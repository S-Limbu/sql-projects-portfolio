# 🎯 Analysis: Revenue by Marketing Channel

---

## 🧠 Problem / Business Scenario
You’re a Growth Analyst at a digital e-commerce company.
The Marketing team wants to understand which acquisition channels (Organic, Paid Ads, Email, etc.) are actually **generating revenue, not just bringing users**.

Their goal is to: Allocate budget more efficiently, Identify high-performing channels and Reduce waste on underperformers

---

## 💡 Why This Matters

- Reveals **ROI per marketing source** (not just traffic volume)

- Helps **optimize customer acquisition cost** (CAC) by focusing on channels with stronger conversion to purchase

- Enables **data-driven decisions** around budgeting, targeting, and experimentation

---

## 🧰 SQL Concepts Used

| Concept    | Purpose                                                  |
| ---------- | -------------------------------------------------------- |
| `JOIN`     | Combine purchase and user info by user ID                |
| `SUM()`    | Aggregate purchase amounts to calculate total revenue    |
| `GROUP BY` | Group by source channel to compare revenue contributions |
| `ORDER BY` | Rank channels from highest to lowest revenue             |

---

## 🧪 Query Logic Breakdown

```sql
SELECT 
  u.source,
  SUM(p.amount) AS total_revenue 
FROM purchases p
JOIN users u ON p.user_id = u.user_id
GROUP BY u.source
ORDER BY total_revenue DESC;


What’s happening and why?

- JOIN connects the purchases table with the users table, using user_id as a foreign key.

- SUM(p.amount) calculates total purchase revenue per user source.

- GROUP BY u.source groups the result set by acquisition source (Ads, Organic, Email).

- ORDER BY total_revenue DESC sorts the results so we can see top-performing channels first.

This query enables the marketing team to compare total sales revenue driven by each source.

📊 Sample Output

| Source  | Total Revenue |
| ------- | ------------- |
| Ads     | 400           |
| Organic | 240           |
| Email   | 100           |

🔍 Business Insight

- Ads is driving the highest revenue, making it a strong candidate for increased ad spend.

- Organic performs well too — possibly due to SEO or brand strength.

- Email brings the lowest revenue, which may suggest:

- It needs better targeting or messaging.

- Or it serves better as a retention tool rather than an acquisition channel.

This allows the team to make evidence-backed budget decisions, and possibly experiment further by improving underperforming sources or doubling down on winners.

🔑 Takeaway
This analysis highlights which marketing efforts are translating into actual revenue — not just signups.
It's a key step in optimizing marketing ROI, refining audience targeting, and scaling only what’s proven to work.
