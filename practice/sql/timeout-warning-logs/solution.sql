SELECT
  *
FROM server_logs
WHERE log_level = 'WARN' 
  AND message = 'Connection timeout after 30s'
