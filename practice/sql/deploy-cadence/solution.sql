SELECT
  LOWER(env_name) AS env_name,
  COUNT(*) AS deploy_count, 
  AVG(dur_secs) AS avg_duration,
  COUNT(DISTINCT LOWER(TRIM(svc_name))) AS unique_services
FROM deploy_logs
GROUP BY LOWER(env_name)
ORDER BY deploy_count DESC
