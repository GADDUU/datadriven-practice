SELECT
  EXTRACT(HOUR FROM call_time) AS hour,
  AVG(latency) AS avg_latency
FROM api_calls
WHERE EXTRACT(HOUR FROM call_time) BETWEEN 15 AND 17
GROUP BY hour
