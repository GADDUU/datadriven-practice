SELECT
  svc_name, 
  COUNT(*) AS deploy_count,
  COUNT(*) FILTER(WHERE LOWER(status) = 'success') AS success_count,
  ROUND(CAST(COUNT(*) FILTER(WHERE LOWER(status) = 'success') * 100 AS DOUBLE) / COUNT(*), 1) AS success_pct
FROM deploy_logs
WHERE EXTRACT(YEAR FROM deploy_at) = 2026
GROUP BY svc_name
HAVING COUNT(*) >= 15
ORDER BY success_pct
