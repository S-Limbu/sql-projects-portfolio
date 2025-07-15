# 📦 Analysis: Identifying the Second-Highest Salary for HR Compensation Benchmarking

---

## 🧠 Business Scenario
The HR Team is conducting a salary band review and wants to identify the second-highest salary in the company. This is part of a broader initiative to understand current pay distribution, evaluate fairness, and redesign competitive compensation strategies.

---

## 💡 Why This Insight Matters

- Helps **benchmark compensation** for future salary bands and promotions.

- Supports detection of **gaps or outliers** in pay across employees.

- Assists in **maintaining equity and transparency** within the organization’s compensation model.

---

## 🧰 SQL Concepts Used

| Concept          | Purpose                                                            |
| ---------------- | ------------------------------------------------------------------ |
| `DISTINCT`       | Ensures only unique salary values are considered                   |
| `ORDER BY`       | Sorts salaries from highest to lowest                              |
| `OFFSET + LIMIT` | Skips the highest salary and retrieves the second-highest only     |
| `WHERE` clause   | Matches employee(s) with the exact salary pulled from the subquery |

---

## 🧪 Query Logic Breakdown

```sql 
SELECT name, salary
FROM employees
WHERE salary = (
  SELECT DISTINCT salary
  FROM employees
  ORDER BY salary DESC
  OFFSET 1 LIMIT 1
);

What’s happening and why?

The subquery gets all unique salary values and sorts them in descending order.

OFFSET 1 LIMIT 1 skips the top salary and returns the second-highest.

The outer query then matches this salary against the employees table to return the name(s) and salary of employee(s) earning it.

📊 Output Summary

Assuming the salary values in the dataset, the top three distinct salaries are:

92000

90000

88000

The query returns:

| Name | Salary |
| ---- | ------ |
| Ray  | 90000  |

🔍 Business Insight
Ray earns the second-highest salary in the company at £90,000, just below Chanel’s £92,000. This allows HR to:

- Use £90K as a benchmark when setting upper salary limits for certain roles.

- Evaluate whether similar roles deserve adjustments to remain competitive.

- Ensure top-performers are compensated fairly without excessive gaps.

✅ Takeaway
Ray holds the second-highest salary in the company — a key data point for HR when benchmarking competitive pay and ensuring fairness across teams.
