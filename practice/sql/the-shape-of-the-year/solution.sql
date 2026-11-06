SELECT
  TO_CHAR(transaction_date, 'YYYY-MM') AS month,
  SUM(total_amount) AS total_revenue,
  COUNT(*) AS num_transactions,
  AVG(total_amount) AS avg_transaction_value
FROM transactions
GROUP BY month
ORDER BY month ASC
