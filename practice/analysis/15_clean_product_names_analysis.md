# 🎯 Analysis: Standardizing Product Names from Supplier Feeds

---

## 🧠 Business Scenario
The Data Team needs to clean and standardize inconsistent product names (e.g., varied casing, extra spaces) that come from different suppliers. These inconsistencies prevent accurate reporting, grouping, and joining of datasets.

---

## 💡 Why This Insight Matters

- Ensures **data quality and consistency** for reporting and analytics.

- Prevents mismatches in **joins, filters, and aggregations** across systems.

- Produces **clean, professional labels** in dashboards, exports, and user interfaces.

## 🧰 SQL Concepts Used

| Concept     | Purpose                                                             |
| ----------- | ------------------------------------------------------------------- |
| `LOWER()`   | Converts all text to lowercase for consistent comparison            |
| `TRIM()`    | Removes unnecessary leading/trailing spaces                         |
| `REPLACE()` | (Optional in advanced cleanup) Used to eliminate extra inner spaces |

---

## 🧪 Query Logic Breakdown

```sql
SELECT 
id,
raw_name,
LOWER(TRIM(raw_name)) AS clean_name
FROM products;


What’s happening and why?

- TRIM(raw_name) removes any leading or trailing spaces.

- LOWER(...) ensures all product names use lowercase.

- Result is a clean, normalized product name field.

📊 Output Summary

| id | raw\_name  | clean\_name |
| -- | ---------- | ----------- |
| 1  | "  PHONE " | phone       |
| 2  | "Phone"    | phone       |
| 3  | "phone"    | phone       |
| 4  | "Tablet"   | tablet      |
| 5  | "tablet "  | tablet      |

🔍 Business Insight
Despite differences in formatting (spaces and casing), these product names refer to the same underlying items. Cleaned data enables accurate product grouping, supports better decision-making, and prevents duplicate listings in reports.

🔑 Takeaway
Cleaned and standardized product names make data consistent, joinable, and ready for trustworthy reporting.
