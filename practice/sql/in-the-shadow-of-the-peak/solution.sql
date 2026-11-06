WITH ranked_amount AS (
  SELECT
    LOWER(provider) AS provider,
    amount,
    DENSE_RANK() OVER(PARTITION BY LOWER(provider) ORDER BY amount DESC) AS rnk
  FROM cloud_costs
)
  
SELECT DISTINCT
  provider,
  amount AS second_highest
FROM ranked_amount
WHERE rnk = 2
ORDER BY second_highest DESC
