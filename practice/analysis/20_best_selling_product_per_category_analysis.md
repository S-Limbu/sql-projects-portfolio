# 🎯 Analysis: Best-Selling Product by Revenue in Each Category

---

# 🧠 Business Scenario
You’re a Retail Analyst at a multi-category retail company.
The leadership team wants to know:

**“What’s the highest-revenue product in each category?”**

This helps them **invest marketing dollars, manage inventory, and align promotions** with top performers.

---

# 💡 Why This Insight Matters

- Spot top-selling products to **maximize ROI through promotions**.

- **Optimize stock and inventory** based on proven demand.

- Fuel **forecasting and budgeting** with strong product-category leaders.

- Supports **targeted campaigns** and category-specific merchandising.

---

# 🧰 SQL Concepts Used

| Concept                              | Purpose                                         |
| ------------------------------------ | ----------------------------------------------- |
| `JOIN`                               | Combine sales and product info for full context |
| `GROUP BY` + `SUM(quantity * price)` | Aggregate revenue by product                    |
| `CTE (WITH)`                         | Structure logic into reusable building blocks   |
| `RANK() OVER (PARTITION BY ...)`     | Find the top product per category               |
| `PARTITION BY`                       | Ensures ranking resets per category             |
| `WHERE rnk = 1`                      | Filters for **top-ranked product per category** |

---

# 🧪 Query Logic Breakdown

```sql
WITH product_revenue AS (
  SELECT 
    p.category,
    p.name,
    SUM(s.quantity * s.price) AS revenue
  FROM sales s
  JOIN products p ON s.product_id = p.product_id
  GROUP BY p.category, p.name
),
ranked AS (
  SELECT *,
    RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
  FROM product_revenue
)
SELECT 
  category,
  name AS best_product,
  revenue
FROM ranked
WHERE rnk = 1;


What’s happening and why?

- product_revenue CTE
→ Calculates total revenue (quantity × price) for each product grouped by category.
This shows how much each product earned in its category.

- ranked CTE
→ Assigns a ranking within each category based on descending revenue using RANK().
The product with rnk = 1 is the top-selling one for that category.

- Final SELECT
→ Filters to include only the top product per category, giving a clean, actionable list.

📊 Sample Output

| category    | best\_product | revenue |
| ----------- | ------------- | ------- |
| Clothing    | Hoodie        | 1900    |
| Electronics | Laptop        | 2500    |
| Food        | Chips         | 110     |
| Stationary  | Pens          | 480     |

🔍 Business Insight

- This analysis pinpoints the top-revenue-generating product in each category, giving decision-makers a focused list of proven performers. The insight can be directly applied across departments:

- Merchandising teams can prioritize these products for front-page features, bundles, or seasonal campaigns to amplify impact.

- Inventory & Operations can optimize stock levels, ensuring the best-sellers don’t run out, while avoiding overstock of lower performers.

- Marketing can double down on high-ROI products through category-specific ads or email campaigns tailored to popular items.

- Finance & Leadership can use this as a benchmark to assess category health and revenue concentration risks.

- By continuously monitoring the top performers in each category, the business ensures it is leaning into what’s working, fueling profitability, and making strategic trade-offs with confidence.

🔑 Takeaway
This insight gives your team a razor-sharp view of:

What’s working (and should be pushed further)

What category leaders deserve more visibility or inventory

Where to direct category-specific marketing efforts

It’s the kind of analysis that supports data-driven merchandising, sales targeting, and inventory forecasting.
