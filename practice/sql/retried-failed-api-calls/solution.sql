WITH  flagged_retries AS (
  SELECT
    user_id,
    endpoint,
    status,
    call_time,
    LAG(call_time) OVER(
      PARTITION BY user_id, endpoint
      ORDER BY call_time
    ) AS prev_call_time
  FROM api_calls
)

SELECT
  user_id,
  endpoint,
  COUNT(*) AS retry_count
FROM flagged_retries
WHERE status >= 400
  AND prev_call_time IS NOT NULL
  AND call_time <= prev_call_time + INTERVAL '5 minutes'
GROUP BY user_id, endpoint
HAVING COUNT(*) > 0
ORDER BY 
  retry_count DESC,
  user_id ASC,
  endpoint ASC
