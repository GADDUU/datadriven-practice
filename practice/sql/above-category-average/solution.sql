WITH product_avg AS (
  SELECT
    p.product_id,
    p.product_name,
    p.category,
    AVG(t.total_amount) AS product_avg
  FROM products AS p
  JOIN transactions AS t
    ON p.product_id = t.product_id
  GROUP BY p.product_id, p.product_name, p.category
),
category_avg AS (
  SELECT
    p.category,
    AVG(t.total_amount) AS category_avg
  FROM products AS p
  JOIN transactions AS t
    ON p.product_id = t.product_id
  GROUP BY p.category
)

SELECT
  pa.product_name,
  ROUND(pa.product_avg::numeric, 3) AS product_avg,
  ROUND(ca.category_avg::numeric, 3) AS category_avg
FROM product_avg AS pa
JOIN category_avg AS ca
  ON pa.category = ca.category
WHERE pa.product_avg > ca.category_avg
ORDER BY pa.product_avg DESC
