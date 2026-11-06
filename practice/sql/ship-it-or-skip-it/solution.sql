SELECT
  CAST(deploy_at AS DATE) AS deploy_date,
  COUNT(*) AS deploy_count
FROM deploy_logs
GROUP BY CAST(deploy_at AS DATE)
ORDER BY deploy_date
