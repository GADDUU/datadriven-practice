SELECT
  env_name,
  COUNT(log_id) AS deploy_count
FROM deploy_logs
GROUP BY env_name
