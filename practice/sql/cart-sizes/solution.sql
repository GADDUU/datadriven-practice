SELECT
  u.username,
  COUNT(t.transaction_id) AS purchase_count,
  SUM(t.total_amount) AS total_spent
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
WHERE t.total_amount > 0
GROUP BY u.username
HAVING COUNT(t.transaction_id) > 12
ORDER BY total_spent DESC
