SELECT
  product_id,
  base_price
FROM (
  SELECT
    product_id,
    MIN(total_amount) AS base_price,
    AVG(total_amount) OVER() AS avg_amount
  FROM transactions
  GROUP BY product_id
)
GROUP BY product_id
HAVING base_price > avg_amount
