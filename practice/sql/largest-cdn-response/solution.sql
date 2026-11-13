SELECT
  *
FROM cdn_logs
WHERE EXTRACT(YEAR FROM served_at) = 2026
ORDER BY bytes DESC, log_id
LIMIT 1
