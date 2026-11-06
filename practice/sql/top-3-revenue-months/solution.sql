SELECT
  TO_CHAR(transaction_date, 'YYYY-MM') AS year_month,
  SUM(total_amount) AS total_sales
FROM transactions
GROUP BY year_month
ORDER BY total_sales DESC
LIMIT 3
