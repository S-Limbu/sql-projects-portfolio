# 🎯 Analysis: Employee Salary Ranking with Window Functions

---

## 🧠 Business Scenario

The HR department is conducting an internal salary analysis to understand how employee compensation is distributed. The goal is to rank employees by salary to assist with transparent compensation planning, fair pay structures, and to flag any anomalies in pay across the organization.

---

## 💡 Why This Insight Matters

- **Compensation Equity**: Ranks help HR ensure fairness across roles and seniority levels.
- **Leadership Pipelines**: High earners may also be top performers or in key roles — this analysis helps spotlight them.
- **Anomaly Detection**: Outliers (very high or low earners) can be quickly spotted for deeper investigation.

---

## 🧰 SQL Concepts Used

| Concept                    | Purpose                                                                 |
|----------------------------|-------------------------------------------------------------------------|
| `RANK()` Window Function   | Assigns a rank to each employee based on salary, allowing for ties.     |
| `OVER (ORDER BY salary DESC)` | Sorts salaries from highest to lowest to calculate rank.            |
| `ORDER BY`                 | Not required in the subquery, but applied to clean output display.       |

---

## 🧪 Query Logic Breakdown

```sql
SELECT name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

- RANK() is a window function that assigns a rank based on the order of salary.

- OVER (ORDER BY salary DESC) tells SQL to rank employees starting with the highest salary.

- If two or more employees have the same salary, they receive the same rank, and the next rank(s) are skipped — this is what distinguishes RANK() from DENSE_RANK() or ROW_NUMBER().

📊 Output Summary

| name    | salary | salary\_rank |
| ------- | ------ | ------------ |
| Rob     | 90000  | 1            |
| Melissa | 90000  | 1            |
| Bob     | 86700  | 3            |
| Cane    | 85000  | 4            |
| Sam     | 70000  | 5            |
| Diana   | 60000  | 6            |
| Michael | 60000  | 6            |
| Tyler   | 50000  | 8            |
| Daniel  | 40400  | 9            |

- Rob and Melissa share the top spot with a salary of 90,000 — both ranked 1.

- Diana and Michael are tied at rank 6, both earning 60,000.

- Notice the rank skips (e.g. no rank 2 or 7), which is expected behavior of RANK().

🔍 Business Insight
There’s a tie at the top, which may prompt HR to compare performance metrics between Rob and Melissa for leadership consideration.

Salary clustering around mid-ranges (60K–85K) suggests potential for standardizing bands.

Daniel's low rank (last place) could highlight an undercompensated role or a junior-level position worth reviewing.

🔑 Takeaway
Window functions like RANK() offer a powerful, transparent way to compare rows without aggregation. They’re ideal for compensation analysis, performance evaluations, and benchmarking.

This kind of ranking system makes your dashboards and salary banding audits more actionable, fair, and data-backed.
