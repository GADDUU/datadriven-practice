WITH all_costs AS (
  SELECT
    provider,
    amount
  FROM cloud_costs
  
  UNION ALL
    
  SELECT
    category AS provider,
    amount
  FROM cost_allocs
)
  
SELECT
  provider,
  MIN(amount) AS min_amount,
  MAX(amount) AS max_amount,
  AVG(amount) AS avg_amount
FROM all_costs
GROUP BY provider
