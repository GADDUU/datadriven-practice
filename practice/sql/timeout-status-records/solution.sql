SELECT
  *
FROM svc_health
WHERE LOWER(status) = 'timeout'
