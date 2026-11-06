SELECT
  log_level,
  COUNT(*) AS entry_count
FROM server_logs
GROUP BY log_level
