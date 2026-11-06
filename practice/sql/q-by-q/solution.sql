SELECT
  TO_CHAR(deploy_at, 'YYYY-"Q"Q') AS quarter,
  ROUND(CAST(COUNT(*) AS DOUBLE) / 13, 3) deploys_per_week
FROM deploy_logs
GROUP BY quarter
ORDER BY deploys_per_week DESC, quarter
