SELECT
  user_id,
  SUM(total_amount) AS total_revenue
FROM transactions
WHERE TO_CHAR(transaction_date, 'YYYY-MM') = '2026-03'
GROUP BY user_id
