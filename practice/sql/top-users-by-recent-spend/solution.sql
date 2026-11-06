SELECT
  user_id,
  COUNT(*) AS purchase,
  ROUND(AVG(total_amount), 3) AS avg_spend
FROM transactions 
WHERE transaction_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY user_id
HAVING COUNT(*) >= 2
ORDER BY avg_spend DESC
LIMIT 3
