SELECT
  endpoint,
  COUNT(DISTINCT user_id) AS user_count
FROM api_calls
WHERE TO_CHAR(call_time, 'YYYY-MM') = '2026-06'
GROUP BY endpoint
