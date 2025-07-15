# 🎯 Analysis: Identifying Premium-Priced Products Using Subqueries

---

## 🧠 Business Scenario
The E-commerce Pricing Team wants to identify premium-priced products — defined as any item priced above the average price in the store. This helps them strategically plan bundles, promotions, and margin optimizations.

---

## 💡 Why This Insight Matters

- Helps segment inventory into **“budget,”** **“standard,”** and **“premium”** tiers.

- Enables pricing teams to make **informed decisions** based on actual value distribution.

- Supports **personalized marketing** and targeted upselling of higher-value items.

---

## 🧰 SQL Concepts Used
| Concept    | Purpose                                                           |
| ---------- | ----------------------------------------------------------------- |
| `SUBQUERY` | Dynamically calculates average price for use in the outer query   |
| `AVG()`    | Computes the mean value of all product prices                     |
| `WHERE`    | Filters products above the average, classifying them as “premium” |

---

## 🧪 Query Logic Breakdown

```sql 
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);


What's happening and why?

First, the average price is calculated using a subquery:
SELECT AVG(price) FROM products.

Then, we filter the products where price > average, identifying premium items in real-time.

📊 Output Summary

The average price across all products is £415. The query returns:

| Product Name  | Price |
| ------------- | ----- |
| Headphones    | 500   |
| Laptop        | 1000  |
| Watch         | 650   |
| Playstation 5 | 550   |

These products are considered premium-tier.

🔍 Business Insight
The results show that high-value, tech-oriented products dominate the premium segment. This highlights a possible opportunity for bundling or marketing high-end electronics, as they consistently price above average.

The store can:

- Create “premium bundles” or showcase these products in exclusive deals.

- Adjust stocking levels to meet demand for higher-end products.

- Focus margin analysis and promotional budgets around these key items.

🔑 Takeaway
High-ticket electronics like laptops and gaming consoles consistently price above average — ideal candidates for premium marketing strategies and bundle promotions.
