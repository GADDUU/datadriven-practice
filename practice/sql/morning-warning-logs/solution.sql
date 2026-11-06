SELECT
  *
FROM server_logs
WHERE log_level = 'WARN'
  AND EXTRACT(HOUR FROM log_timestamp) < 12
