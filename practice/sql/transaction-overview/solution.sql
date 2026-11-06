SELECT
  COUNT(DISTINCT user_id) AS unique_purchasers,
  AVG(total_amount) AS avg_transaction_amount
FROM transactions
