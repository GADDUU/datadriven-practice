SELECT
  endpoint,
  latency
FROM api_calls
ORDER BY latency DESC
LIMIT 3
