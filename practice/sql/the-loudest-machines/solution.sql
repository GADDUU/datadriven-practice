SELECT
  server_name,
  COUNT(*) AS log_count
FROM server_logs 
WHERE EXTRACT(YEAR FROM log_timestamp) = 2026
GROUP BY server_name
ORDER BY log_count DESC
