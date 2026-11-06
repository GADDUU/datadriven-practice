SELECT
  TO_CHAR(deploy_at, 'YYYY-MM') AS month,
  COUNT(DISTINCT (svc_name || version)) AS unique_deployments
FROM deploy_logs
GROUP BY TO_CHAR(deploy_at, 'YYYY-MM') 
ORDER BY month
