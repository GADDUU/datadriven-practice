SELECT
  u.username,
  t.total_amount,
  t.transaction_date
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
WHERE t.total_amount > 50
ORDER BY username
