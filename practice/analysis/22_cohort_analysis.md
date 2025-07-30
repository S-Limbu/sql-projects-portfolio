# 🎯 Analysis: Cohort-Based User Retention Tracking

---

## 🧠 Problem / Business Scenario
You work with the Product team of a digital product or app.
They want to track **how many users remain active over time** based on the month they signed up — this is called **Cohort Analysis**.

The goal is to understand: How long new users stay engaged, If product changes improve retention and When and why users drop off after joining

## 💡 Why This Matters

- Low retention often signals **users don’t find value** after sign-up.

- Helps measure the **impact of product changes**, like new onboarding or feature releases.

- Informs **re-engagement or retention strategies** based on actual user behavior.

---

# 🧰 SQL Concepts Used

| Concept                   | Purpose                                                       |
| ------------------------- | ------------------------------------------------------------- |
| `CTE (WITH)`              | Build an intermediate table (`cohorts`) for clean aggregation |
| `DATE_TRUNC('month', …)`  | Group dates by month to define cohorts and activity timelines |
| `JOIN`                    | Connect signups with their activity logs                      |
| `COUNT(DISTINCT user_id)` | Get unique users active in each cohort/month combination      |
| `GROUP BY`                | Aggregate by cohort and active month                          |

---

# 🧪 Query Logic Breakdown

```sql
WITH cohorts AS (
  SELECT 
    s.user_id,
    DATE_TRUNC('month', s.signup_date) AS cohort_month,
    DATE_TRUNC('month', a.activity_date) AS active_month
  FROM signups s
  JOIN activity a ON s.user_id = a.user_id
)
SELECT 
  cohort_month,
  active_month,
  COUNT(DISTINCT user_id) AS active_users
FROM cohorts
GROUP BY cohort_month, active_month
ORDER BY cohort_month, active_month;


What’s happening and why?

- DATE_TRUNC('month', signup_date)
→ Assigns each user to a monthly cohort based on when they signed up.

JOIN activity ON user_id
→ Links each signup to their activity logs.

DATE_TRUNC('month', activity_date)
→ Groups all activity by month for retention analysis.

COUNT(DISTINCT user_id)
→ Shows how many unique users from each cohort were active in a given month.

This results in a matrix-style view where you can track how many users from each cohort month remained active in future months.

📊 Sample Output
This cohort analysis gives the product team visibility into retention behavior over time. For example:

| Cohort Month | Active Month | Active Users |
| ------------ | ------------ | ------------ |
| Jan 2024     | Jan 2024     | 2            |
| Jan 2024     | Feb 2024     | 1            |
| Feb 2024     | Feb 2024     | 4            |
| Feb 2024     | Mar 2024     | 1            |
| Mar 2024     | Mar 2024     | 3            |
| Mar 2024     | Apr 2024     | 1            |
| Mar 2024     | May 2024     | 2            |

🔍 Business Insight

- Jan cohort drops from 2 to 1 user by the second month

- Feb cohort had strong engagement at first (4 users), but only 1 stuck around the next month

- Mar cohort has slightly better second/third-month retention

Identify where users fall off

Compare retention before/after feature releases

A/B test onboarding flows or product changes

🔑 Takeaway
This analysis highlights how sticky your product is over time.
It allows product managers to track the health of each cohort, and adjust strategy to improve lifetime value and user satisfaction.
