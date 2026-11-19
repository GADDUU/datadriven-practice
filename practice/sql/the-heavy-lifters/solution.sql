WITH revenue1 AS (
  SELECT
    p.category,
    SUM(t.total_amount) AS total_revenue
  FROM products AS p
  INNER JOIN transactions AS t
    ON p.product_id = t.product_id
  GROUP BY p.category
),
revenue2 AS (
  SELECT
    p.category,
    SUM(t.total_amount) AS total_revenue
  FROM products AS p
  INNER JOIN transactions AS t
    ON p.product_id = t.product_id
  WHERE t.total_amount >= 1000
  GROUP BY p.category
)
  
SELECT
  r1.category
FROM revenue1 AS r1
LEFT JOIN revenue2 AS r2
  ON r1.category = r2.category
WHERE r2.total_revenue > r1.total_revenue * 0.5
