WITH ranked_costs AS (
  SELECT
    cost_id,
    amount,
    svc_name,
    MIN(amount) OVER() AS lowest,
    MAX(amount) OVER() AS highest
  FROM cloud_costs
)
  
SELECT
  cost_id,
  amount,
  svc_name,
  CASE 
    WHEN amount = highest THEN 'Highest Cost'
    WHEN amount = lowest THEN 'Lowest Cost'
  END AS cost_type
FROM ranked_costs
WHERE amount = highest OR amount = lowest
