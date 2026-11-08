SELECT
  p.product_name,
  COUNT(t.transaction_id) AS transaction_count
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.product_name
ORDER BY p.product_id
