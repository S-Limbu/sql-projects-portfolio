# 📦 Analysis: Identifying Premium-Priced Products Using Subqueries

---

## 🧠 Business Scenario
The E-commerce Pricing Team wants to identify premium-priced products — defined as any item priced above the average price in the store. This helps them strategically plan bundles, promotions, and margin optimizations.

---

## 💡 Why This Insight Matters
Helps segment inventory into “budget,” “standard,” and “premium” tiers.

Enables pricing teams to make informed decisions based on actual value distribution.

Supports personalized marketing and targeted upselling of higher-value items.

---

## 🧰 SQL Concepts Used
| Concept    | Purpose                                                           |
| ---------- | ----------------------------------------------------------------- |
| `SUBQUERY` | Dynamically calculates average price for use in the outer query   |
| `AVG()`    | Computes the mean value of all product prices                     |
| `WHERE`    | Filters products above the average, classifying them as “premium” |
