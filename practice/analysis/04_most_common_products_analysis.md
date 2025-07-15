# 🎯 Analysis: Most Frequently Sold Products

---

## 🧠 Business Scenario

The Product Team is interested in identifying which products are sold the most. This information will help prioritize stock replenishment, bundling decisions, and promotional strategies. The ultimate goal is to double down on top-selling items that drive the most customer demand.

---

## 💼 Why This Insight Matters

- Helps align inventory planning with actual customer demand, reducing waste and stockouts.
- Identifies products to feature in high-visibility marketing campaigns or bundles.
- Supports data-driven decisions on procurement and warehouse stocking priorities.
- Allows the company to focus its advertising budget on products with proven sales velocity.

---

## 🧰 SQL Concepts Used

| Concept         | Purpose                                                        |
|------------------|----------------------------------------------------------------|
| `COUNT(*)`       | Counts how many times each product appears (i.e., sold).       |
| `GROUP BY`       | Aggregates sales by each unique product.                       |
| `ORDER BY`       | Sorts the result by the frequency of sales, highest first.     |

---

## 🧪 Query Logic Breakdown

```sql
SELECT product_name, COUNT(*) AS count_sold
FROM sales
GROUP BY product_name
ORDER BY count_sold DESC;

Step 1: GROUP BY product_name — Groups the rows in the table by product to analyze frequency per item.

Step 2: COUNT(*) — Counts the number of sales (rows) associated with each product.

Step 3: ORDER BY count_sold DESC — Sorts the result in descending order so that the most sold products appear at the top.

📊 Output Summary
product_name	count_sold
iPhone	3
Samsung	2
Huawei	1

- The iPhone is the most frequently sold product with 3 sales.

- Samsung follows with 2 units sold.

- Huawei trails with just 1 sale.

🔍 Business Insight
This data indicates that the iPhone is significantly outperforming other products in terms of sales volume. It would be strategic to feature it in promotions, ensure it's fully stocked, and possibly bundle it with accessories to drive additional sales.

In contrast, Huawei, with just one sale, may not currently warrant as much marketing or inventory allocation. However, its performance might improve with better positioning or pricing.

✅ Takeaway
Simple frequency analysis using COUNT() and GROUP BY gives powerful insight into product performance. These insights can fuel smarter merchandising, better ad targeting, and more strategic inventory planning.
