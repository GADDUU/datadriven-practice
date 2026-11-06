SELECT
  EXTRACT(MONTH FROM transaction_date) AS month,
  COUNT(DISTINCT user_id) AS unique_users,
  COUNT(*) AS total_transactions
FROM transactions
WHERE total_amount >= 50
GROUP BY month
