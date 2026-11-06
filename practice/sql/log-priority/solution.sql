SELECT
  server_name,
  log_level,
  response_time_ms,
  CASE
    WHEN log_level = 'CRITICAL' OR log_level = 'ERROR' THEN 'urgent'
    ELSE 'routine'
  END AS triage
FROM server_logs
WHERE response_time_ms IS NOT NULL
