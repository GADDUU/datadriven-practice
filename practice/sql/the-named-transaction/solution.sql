SELECT
  t.transaction_id,
  t.user_id,
  t.product_id,
  t.quantity,
  t.transaction_date,
  p.product_name
FROM transactions AS t
INNER JOIN products AS p
  ON t.product_id = p.product_id
 ORDER BY t.transaction_id
