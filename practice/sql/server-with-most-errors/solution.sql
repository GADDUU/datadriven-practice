SELECT
  server_name,
  COUNT(log_id) AS error_count
FROM server_logs
WHERE LOWER(log_level) = 'error'
GROUP BY server_name
ORDER BY error_count DESC, server_name ASC
LIMIT 1
