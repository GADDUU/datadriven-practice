SELECT
  user_id,
  SUM(total_amount) AS lifetime_spend,
  COUNT(*) AS tx_count
FROM transactions 
GROUP BY user_id
HAVING lifetime_spend > 500
ORDER BY lifetime_spend DESC
