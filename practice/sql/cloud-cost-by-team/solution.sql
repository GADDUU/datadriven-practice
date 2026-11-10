SELECT
  team_name,
  SUM(amount) AS total_cost
FROM cost_allocs
GROUP BY team_name
ORDER BY total_cost DESC
