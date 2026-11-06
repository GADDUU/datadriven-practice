SELECT
  COUNT(DISTINCT u.user_id) AS active_users_with_transactions
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
WHERE EXTRACT(YEAR FROM t.transaction_date) = 2026
  AND EXTRACT(MONTH FROM t.transaction_date) = 4
  AND u.account_status = 'active'
