SELECT
  endpoint,
  latency
FROM api_calls
WHERE endpoint LIKE '%auth%'
ORDER BY call_time ASC
