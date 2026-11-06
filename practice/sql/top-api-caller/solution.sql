SELECT
  user_id,
  COUNT(call_id) AS call_count
FROM api_calls
WHERE user_id IS NULL
GROUP BY user_id
