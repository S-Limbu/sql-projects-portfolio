# 🎯 Analysis: Top-Selling Product by Month

---

## 🧠 Business Scenario
The Sales Team needs to track the highest-selling product each month based on quantity sold. This supports demand forecasting, inventory control, and promotional planning throughout the year.

## 💡 Why This Insight Matters

- Improves **inventory planning** by ensuring high-demand products are always in stock.

- Identifies **seasonal trends** and product performance across months.

- Supports smarter decisions in **marketing, bundling, and product development**.

## 🧰 SQL Concepts Used

| Concept                         | Purpose                                                               |
| ------------------------------- | --------------------------------------------------------------------- |
| `CTE (Common Table Expression)` | Structures the query in readable stages                               |
| `RANK()`                        | Assigns a rank to products based on quantity sold within each month   |
| `PARTITION BY`                  | Resets the ranking for each month to find top sellers per time period |
| `DATE_TRUNC()`                  | Groups sales data by calendar month                                   |
| `GROUP BY`                      | Aggregates total quantity per product per month                       |

---

## 🧪 Query Logic Breakdown

```sql
WITH monthly_sales AS (
  SELECT 
    DATE_TRUNC('month', sale_date) AS month, 
    product,
    SUM(quantity) AS total_quantity
  FROM sales
  GROUP BY month, product
),
ranked AS (
  SELECT *,
         RANK() OVER (PARTITION BY month ORDER BY total_quantity DESC) AS rnk
  FROM monthly_sales
)
SELECT * 
FROM ranked
WHERE rnk = 1;


What’s happening and why?

- First, we summarize monthly quantity sold per product (monthly_sales CTE).

- Next, we rank products by total quantity sold within each month (ranked CTE).

- Finally, we select only those ranked #1, i.e., top-selling products per month.

📊 Output Summary

| month      | product | total\_quantity | rnk |
| ---------- | ------- | --------------- | --- |
| 2023-01-01 | Phone   | 3               | 1   |
| 2023-02-01 | Tablet  | 9               | 1   |
| 2023-03-01 | Laptop  | 14              | 1   |

🔍 Business Insight

January: Phone leads sales, but volume is relatively low.

February: Tablet dominates with the highest monthly total (9 units).

March: Laptop is clearly the top performer (14 units), suggesting rising demand or promotions.

This provides a clear snapshot of which product deserves priority in terms of stocking, marketing spend, and bundling.

🔑 Takeaway
Laptops and Tablets are top-selling products in recent months — ideal candidates for marketing focus and inventory scaling.
