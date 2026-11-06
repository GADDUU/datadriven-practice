SELECT
  SUM(amount) AS total_amount
FROM cost_allocs
WHERE LOWER(team_name) IN ('data-eng', 'backend', 'devops', 'platform' )
