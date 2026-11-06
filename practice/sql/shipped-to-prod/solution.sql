SELECT
  env_name,
  COUNT(*) AS deploy_count
FROM deploy_logs
GROUP BY env_name
ORDER BY deploy_count DESC
