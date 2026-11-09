SELECT
  status,
  AVG(latency) AS avg_latency
FROM api_calls
GROUP BY status
ORDER BY status ASC
