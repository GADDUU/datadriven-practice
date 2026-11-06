SELECT
  log_level,
  COUNT(log_id) FILTER (
    WHERE log_level IN ('CRITICAL', 'ERROR', 'WARN')
  ) AS total_count
FROM server_logs
GROUP BY log_level
HAVING total_count <> 0
