SELECT
  svc_name,
  amount
FROM cloud_costs
ORDER BY amount DESC, svc_name ASC
LIMIT 1
