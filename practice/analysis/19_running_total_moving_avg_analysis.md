# 🎯 Analysis: Daily Revenue Trends – Running Total + 3-Day Moving Average

---

## 🧠 Business Scenario
You’re a Financial Analyst at a tech company. Your manager needs visibility into:

Daily cumulative revenue

Short-term 3-day moving averages of transaction amounts

This helps identify performance trends, highlight outliers, and assist in pacing revenue goals.

---

## 💡 Why This Insight Matters

- Tracks **how revenue builds up** across time (cumulative trend).

- Helps **spot spikes/drops** relative to the short-term average.

- Useful for **forecasting, budgeting, and sales pacing**.

---

# 🧰 SQL Concepts Used

| Concept                             | Purpose                                            |
| ----------------------------------- | -------------------------------------------------- |
| `SUM() OVER (ORDER BY ...)`         | Computes **running total** of revenue by day       |
| `AVG() OVER (...) ROWS BETWEEN ...` | Computes **3-day moving average** around each date |
| `ROUND()`                           | Rounds the average to 2 decimal places             |
| `WINDOW FRAME` (`ROWS BETWEEN ...`) | Controls the rolling window of data to average     |

---

# 🧪 Query Logic Breakdown

```sql
SELECT 
  transaction_date,
  amount,
  SUM(amount) OVER (ORDER BY transaction_date) AS running_total,
  ROUND(
    AVG(amount) OVER (
      ORDER BY transaction_date
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2
  ) AS moving_avg_3d
FROM transactions;


What’s happening and why?

SUM(amount) OVER (ORDER BY transaction_date)
→ Creates a cumulative total of revenue across days, showing how much has been earned up to each date.

AVG(amount) OVER (...) ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
→ Calculates a 3-day moving average of revenue centered on the current row, including the current date and two days prior.
This smooths out short-term fluctuations and highlights underlying trends.

ROUND(..., 2)
→ Ensures the moving average is cleanly formatted for reporting (two decimal places).

📊 Sample Output (simplified)

| transaction\_date | amount | running\_total | moving\_avg\_3d |
| ----------------- | ------ | -------------- | --------------- |
| 2024-01-01        | 100    | 100            | 100.00          |
| 2024-01-02        | 200    | 300            | 150.00          |
| 2024-01-03        | 150    | 450            | 150.00          |
| 2024-01-04        | 180    | 630            | 176.67          |
| 2024-01-05        | 300    | 930            | 210.00          |
| ...               | ...    | ...            | ...             |

🔑 Takeaway
This combined view of daily revenue, cumulative growth, and short-term trends offers a powerful snapshot for:

Daily financial monitoring

Planning sales quotas

Spotting sudden changes in revenue trajectory

It’s perfect for feeding into dashboards, reporting systems, or early warning alerts for revenue dips.
