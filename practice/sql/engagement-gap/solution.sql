SELECT
  u.username,
  COUNT(transaction_id) AS transaction_count
FROM users AS u
LEFT JOIN transactions AS t
  ON u.user_id = t.user_id
  GROUP BY u.username
  ORDER BY u.username
