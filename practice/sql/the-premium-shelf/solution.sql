SELECT
  p.product_id,
  LOWER(p.product_name),
  SUM(t.total_amount) / SUM(t.quantity) AS avg_unit_price
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY LOWER(p.product_name)
HAVING SUM(t.total_amount) / SUM(t.quantity) > 100
ORDER BY p.product_id
