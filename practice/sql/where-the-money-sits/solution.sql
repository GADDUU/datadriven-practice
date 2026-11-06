SELECT
  team_name,
  COUNT(*) FILTER(WHERE LOWER(category) = 'compute') AS compute_count,
  SUM(amount) AS total_cost
FROM cost_allocs
GROUP BY team_name
