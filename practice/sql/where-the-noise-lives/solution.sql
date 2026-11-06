SELECT
  DAYNAME(log_timestamp) AS day_of_week,
  COUNT(*) AS entry_count
FROM server_logs
GROUP BY day_of_week
