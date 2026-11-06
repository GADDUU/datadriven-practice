SELECT
  server_name,
  MAX(log_timestamp) AS last_activity
FROM server_logs
GROUP BY server_name
ORDER BY last_activity DESC
