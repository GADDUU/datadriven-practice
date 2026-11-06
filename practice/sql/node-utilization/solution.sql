WITH pre_solve AS (
  SELECT
    LOWER(team_name) AS team_name,
    region,
    ROUND(SUM(amount), 3) AS total_amount,
    CAST(AVG(amount) AS INTEGER) AS avg_alloc_dollars
  FROM cost_allocs
  GROUP BY region, LOWER(team_name)
  ORDER BY region, total_amount DESC
)

SELECT
  team_name,
  region,
  total_amount,
  avg_alloc_dollars,
  ROW_NUMBER() OVER(PARTITION BY region ORDER BY total_amount DESC) AS rnk
FROM pre_solve
