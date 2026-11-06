SELECT
  EXTRACT(YEAR FROM call_time) AS call_year,
  endpoint,
  AVG(latency) AS avg_latency
FROM api_calls
GROUP BY EXTRACT(YEAR FROM call_time), endpoint
ORDER BY call_year, endpoint
