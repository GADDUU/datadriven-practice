SELECT
  SUM(t.total_amount) AS total_spend
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
INNER JOIN products AS p
  ON t.product_id = p.product_id
WHERE u.username = 'alice'
  AND p.category = 'Electronics'
  AND p.rating > 3
