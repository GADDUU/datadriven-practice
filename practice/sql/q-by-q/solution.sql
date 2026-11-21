SELECT
  TO_CHAR(deploy_at, 'YYYY-"Q"Q') AS quarter,
  ROUND(COUNT(*)/ 13.0, 3) deploys_per_week
FROM deploy_logs
GROUP BY 1
ORDER BY deploys_per_week DESC, quarter ASC
