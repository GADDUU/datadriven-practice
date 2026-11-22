SELECT
  transaction_date,
  SUM(total_amount) AS daily_revenue
FROM transactions
WHERE TO_CHAR(transaction_date, 'YYYY-MM') = '2026-09'
GROUP BY transaction_date
ORDER BY transaction_date
