SELECT
  svc_name,
  version,
  dur_secs,
  deploy_at
FROM deploy_logs 
WHERE dur_secs > 150
  AND env_name = 'production'
ORDER BY dur_secs DESC
