SELECT
  COUNT(*) AS no_order_count
FROM users 
WHERE user_id NOT IN (
  SELECT
    user_id
  FROM transactions
)
