SELECT
  COUNT(*) AS failed_deployments
FROM deploy_logs
WHERE LOWER(status) = 'failed'
