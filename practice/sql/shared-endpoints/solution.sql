SELECT
  endpoint,
  COUNT(DISTINCT user_id) AS user_count
FROM api_calls
GROUP BY endpoint
HAVING COUNT(DISTINCT user_id) > 60
