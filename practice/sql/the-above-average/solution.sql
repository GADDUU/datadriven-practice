WITH category_avg AS (
  SELECT
    category,
    AVG(price) AS avg_price
  FROM products
  GROUP BY category
)

SELECT
  p.product_name,
  p.category,
  p.price,
  ca.avg_price
FROM products AS p
INNER JOIN category_avg AS ca
  ON p.category = ca.category
  AND p.price > ca.avg_price
