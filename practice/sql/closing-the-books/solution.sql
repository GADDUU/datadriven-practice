SELECT
  SUM(total_amount * quantity) AS total_revenue
FROM transactions
WHERE TO_CHAR(transaction_date, 'YYYY-MM') = '2026-04'
