SELECT
  log_level,
  COUNT(log_id) AS log_count,
  AVG(response_time_ms) AS avg_response_ms
FROM server_logs
WHERE response_time_ms < 300
GROUP BY log_level
HAVING COUNT(log_id) > 5
ORDER BY log_count DESC
