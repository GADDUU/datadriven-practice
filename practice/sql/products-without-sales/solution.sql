SELECT
  p.product_id,
  p.product_name
FROM products AS p
LEFT JOIN transactions AS t
  ON p.product_id = t.product_id
WHERE t.transaction_id IS NULL
