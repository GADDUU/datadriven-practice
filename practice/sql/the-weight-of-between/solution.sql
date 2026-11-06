SELECT
  team_name || ' - ' || svc_name AS label,
  SUM(amount) AS amount,
  region
FROM cost_allocs
WHERE amount BETWEEN 100 AND 300
GROUP BY label
ORDER BY amount
