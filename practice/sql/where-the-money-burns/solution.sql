SELECT
  svc_name
FROM (
  SELECT
    svc_name,
    amount,
    AVG(amount) OVER() AS avg_cost
  FROM cloud_costs
)
GROUP BY svc_name
HAVING AVG(amount) > avg_cost
ORDER BY svc_name
