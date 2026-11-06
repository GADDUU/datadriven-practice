SELECT
  svc_name,
  COUNT(DISTINCT region) AS region_count,
  CAST(CAST(COUNT(checked) AS DECIMAL) / COUNT(DISTINCT region) AS DECIMAL) AS checks_per_reigon
FROM svc_health
WHERE EXTRACT(YEAR FROM checked) >= 2024
GROUP BY svc_name
HAVING COUNT(DISTINCT region) = 2
ORDER BY svc_name
LIMIT 5
