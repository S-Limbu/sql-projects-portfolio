# 🎯 Analysis: Identifying Duplicate Email Addresses in Customer Data

---

## 🧠 Business Scenario
You work at an e-commerce company that collects user details at checkout and sign-up.
The CRM system suspects duplicate email addresses in the customer database due to:

Multiple sign-ups by the same user

Data entry issues

Lack of email validation

The goal is to detect and list emails that appear more than once in the system.

---

# 💡 Why This Insight Matters

- Data Hygiene: Prevents dirty or inconsistent records in your CRM or analytics system.

- Email Campaign Accuracy: Avoids sending duplicate emails to the same person.

- Fraud Prevention: Highlights suspicious behavior (e.g. multiple accounts for promotions).

- Customer Support Efficiency: Prevents confusion caused by duplicated accounts.

---

## 🧰 SQL Concepts Used

| Concept               | Purpose                                                     |
| --------------------- | ----------------------------------------------------------- |
| `GROUP BY email`      | Group all records by email address                          |
| `COUNT(*)`            | Count how many times each email appears                     |
| `HAVING COUNT(*) > 1` | Filter to keep only those emails that appear multiple times |

---

## 🧪 Query Logic Breakdown

```sql
SELECT email, COUNT(*) AS email_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;


What’s happening and why?
GROUP BY email
→ Aggregates the data to group all rows with the same email address together.

COUNT(*)
→ Counts how many records exist for each grouped email address.

HAVING COUNT(*) > 1
→ Filters out all emails that appear only once, leaving only duplicates in the result.

📊 Sample Output

| email                                 | email\_count |
| ------------------------------------- | ------------ |
| [d@example.com](mailto:d@example.com) | 2            |
| [b@example.com](mailto:b@example.com) | 2            |
| [s@example.com](mailto:s@example.com) | 3            |
| [r@example.com](mailto:r@example.com) | 4            |
| [c@example.com](mailto:c@example.com) | 2            |

 Business Insight
This analysis uncovers specific email addresses that are duplicated across your user base. From a business perspective:

These users are likely to receive redundant communications, which can harm brand trust.

A high duplication rate may indicate flaws in frontend validation, backend merging logic, or CRM sync rules.

Identifying and cleaning duplicates improves your ability to:

Accurately measure unique customer metrics (LTV, churn, engagement).

Maintain healthy segmentation for retargeting or onboarding flows.

Eliminate wasted spend on duplicated ad impressions or email sends.

🔍 Insight: The email r@example.com appears 4 times, showing a high-risk data inconsistency.
That could signal misuse or a need for deduplication logic before the next marketing cycle.

🔑 Takeaway
This query gives you a clean, prioritized list of problematic emails, so your team can:

Deduplicate user records

Trigger validation checks or merge processes

Avoid over-communicating with the same customer

Detect potential abuse (e.g., same user signing up repeatedly)

🛠 It's a critical step for CRM integrity, accurate personalization, and efficient marketing execution.
