SELECT
  user_id,
  SUM(total_amount) FILTER(WHERE EXTRACT(MONTH FROM transaction_date) = 3) AS march_total
FROM transactions
GROUP BY user_id
HAVING SUM(total_amount) FILTER(WHERE EXTRACT(MONTH FROM transaction_date) = 3) IS NOT NULL
ORDER BY march_total DESC
