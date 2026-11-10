SELECT
  LOWER(status) AS status,
  COUNT(check_id) AS check_count
FROM svc_health
WHERE svc_name  = 'auth-svc'
GROUP BY LOWER(status)
