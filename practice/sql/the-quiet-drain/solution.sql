SELECT
  region,
  COUNT(DISTINCT svc_name) AS service_count
FROM cloud_costs
WHERE LOWER(provider) = 'aws'
  AND amount >= 200
GROUP BY region
ORDER BY service_count DESC, region
