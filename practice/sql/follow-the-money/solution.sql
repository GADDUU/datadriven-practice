SELECT
  user_id,
  SUM(total_amount) AS total_spent
FROM transactions 
WHERE EXTRACT(YEAR FROM transaction_date) = 2026
GROUP BY user_id
ORDER BY total_spent DESC
