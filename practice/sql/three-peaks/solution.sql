WITH ranked_costs AS ( 
  SELECT
    LOWER(team_name) AS team_name,
    SUM(amount) AS monthly_cost,
    ROW_NUMBER() OVER(PARTITION BY LOWER(team_name) ORDER BY sum(amount) DESC) AS rnk
  FROM cost_allocs
  GROUP BY 1, period
)
  
SELECT
  team_name,
  monthly_cost
FROM ranked_costs
WHERE rnk <= 3
ORDER BY team_name, monthly_cost DESC;
