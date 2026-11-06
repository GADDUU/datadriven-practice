SELECT
  cc.svc_name,
  SUM(cc.amount) AS  total_amount
FROM cloud_costs AS cc
WHERE cc.svc_name IN (
  SELECT
    svc_name
  FROM cost_allocs
)
GROUP BY cc.svc_name
ORDER BY total_amount DESC
LIMIT 2
