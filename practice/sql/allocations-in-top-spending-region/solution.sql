WITH CTE AS (
  SELECT
    region, 
    SUM(amount) AS total_amount
  FROM cloud_costs
  GROUP BY region
  ORDER BY total_amount DESC
  LIMIT 1
)
  
SELECT
  ca.*
FROM cost_allocs AS ca
INNER JOIN CTE AS c
  ON ca.region = c.region
ORDER BY ca.alloc_id
