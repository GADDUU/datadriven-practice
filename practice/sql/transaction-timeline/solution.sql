SELECT
  u.username,
  MIN(t.transaction_date) AS first_purchase,
  MAX(t.transaction_date) AS latest_purchase,
  SUM(t.total_amount) AS lifetime_spend
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
GROUP BY u.username
ORDER BY u.username
