SELECT
  endpoint,
  COUNT(call_id) AS failure_count,
  AVG(latency) AS avg_latency
FROM api_calls
WHERE status >= 400
GROUP BY endpoint
HAVING COUNT(call_id) > 5
