SELECT
  u.username,
  COUNT(DISTINCT t.product_id) AS distinct_products,
  SUM(t.total_amount) AS total_spend
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
GROUP BY u.username
HAVING distinct_products >= 6
