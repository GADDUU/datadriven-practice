SELECT
  endpoint,
  AVG(latency) AS avg_latency
FROM api_calls
GROUP BY endpoint
ORDER BY avg_latency
LIMIT 3
