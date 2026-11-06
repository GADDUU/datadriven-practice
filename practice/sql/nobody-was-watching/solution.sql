SELECT
  d.svc_name,
  d.version,
  d.env_name,
  d.status
FROM deploy_logs AS d
LEFT JOIN alert_events AS a
  ON d.svc_name = a.svc_name
WHERE alert_id IS NULL 
ORDER BY deploy_at
