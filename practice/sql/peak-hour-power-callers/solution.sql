SELECT
  user_id,
  COUNT(call_id) AS call_count
FROM api_calls
WHERE EXTRACT(HOUR FROM call_time) BETWEEN 15 AND 17
GROUP BY user_id
HAVING COUNT(call_id) >= 3
ORDER BY call_count DESC
