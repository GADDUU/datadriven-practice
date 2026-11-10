SELECT
  *
FROM cdn_logs
WHERE bytes < 5000
ORDER BY bytes
