SELECT
  server_name,
  COUNT(*) AS match_count
FROM server_logs
WHERE REGEXP_LIKE(message, '.{3}-.{4,}')
GROUP BY server_name
ORDER BY match_count DESC, server_name
LIMIT 10
