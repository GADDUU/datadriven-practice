SELECT
  cloud_costs.svc_name AS svc_name,
  ROUND(SUM(cost_allocs.amount) / COUNT(DISTINCT cost_allocs.team_name)) AS budget_per_head
FROM cost_allocs
INNER JOIN cloud_costs
  ON cost_allocs.svc_name = cloud_costs.svc_name
GROUP BY cloud_costs.svc_name
ORDER BY budget_per_head DESC
