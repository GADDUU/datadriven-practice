SELECT
  DATE(
    transaction_date,
    '-' || STRFTIME('%w', transaction_date) || ' days'
  ) AS week_start,
  SUM(quantity) AS total_units
FROM transactions
WHERE transaction_date >= '2026-01-01'
  AND transaction_date <= '2026-03-31'
GROUP BY week_start
ORDER BY week_start
