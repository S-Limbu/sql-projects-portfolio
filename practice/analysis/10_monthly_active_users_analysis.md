# 🎯 Analysis: Tracking Monthly Active Users (MAU)

---

## 🧠 Business Scenario
The Analytics Team needs to **monitor Monthly Active Users** (MAU) — a core metric that indicates how many unique users are engaging with the platform each month. This helps **assess growth, retention, and product health over time**.

---

## 💡 Why This Insight Matters

- Enables **user retention** and **churn analysis** across time periods.

- Provides **key growth metrics** for reporting to stakeholders and investors.

- Uncovers **seasonal trends or spikes** in engagement, supporting marketing and development planning.

---

## 🧰 SQL Concepts Used

| Concept               | Purpose                                                               |
| --------------------- | --------------------------------------------------------------------- |
| `DATE_TRUNC('month')` | Rounds a date down to the first day of its month for monthly grouping |
| `COUNT(DISTINCT ...)` | Ensures each user is only counted once per month                      |
| `GROUP BY`            | Aggregates data per month                                             |
| `ORDER BY`            | Sorts the output chronologically for readability                      |

---

## 🧪 Query Logic Breakdown

```sql
SELECT DATE_TRUNC('month', login_date) AS month,
       COUNT(DISTINCT user_id) AS active_users
FROM logins
GROUP BY month
ORDER BY month;


What’s happening and why?

- DATE_TRUNC('month', login_date) groups logins into months by truncating the full login date.

- COUNT(DISTINCT user_id) counts how many unique users logged in during each month.

- Results are grouped by month and ordered chronologically for clean reporting.

📊 Output Summary

Based on the data provided:

| month      | active\_users |
| ---------- | ------------- |
| 2023-01-01 | 2             |
| 2023-02-01 | 2             |

 January had 2 unique users.

 February also had 2 unique users.

🔍 Business Insight

- MAU remained consistent across January and February with 2 active users each month.

- This suggests a stable user base at this early stage, though growth is not yet visible.

- With more data over time, trends like spikes, drops, or growth periods will become clearer — vital for product development and marketing strategy.

🔑 Takeaway
Monthly active users are steady across the first two months — this insight sets the foundation for monitoring user growth and engagement long-term.
