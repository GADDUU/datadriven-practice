SELECT
  endpoint,
  MAX(latency) AS max_latency
FROM api_calls
WHERE EXTRACT(MONTH FROM call_time) = 3
GROUP BY endpoint
ORDER BY max_latency DESC
