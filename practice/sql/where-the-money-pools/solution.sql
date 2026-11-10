SELECT
  svc_name,
  SUM(amount) AS total_cost
FROM cloud_costs
WHERE region = 'us-west-2'
GROUP BY svc_name
ORDER BY total_cost DESC
