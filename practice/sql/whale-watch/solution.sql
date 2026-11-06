SELECT
  user_id,
  SUM(total_amount) AS total_spend,
  COUNT(transaction_id) AS txn_count,
  ROUND(
    SUM(total_amount) / COUNT(transaction_id),
    2
  ) AS avg_txn_size
FROM transactions
GROUP BY user_id
HAVING COUNT(transaction_id) > 12
ORDER BY total_spend DESC
