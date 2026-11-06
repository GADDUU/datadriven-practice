SELECT
  SUM(amount) FILTER (
    WHERE svc_name = 'EC2'
  ) AS total_spend
FROM cloud_costs
