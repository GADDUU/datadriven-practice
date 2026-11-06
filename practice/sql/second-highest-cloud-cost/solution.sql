SELECT
  amount
FROM (
  SELECT
    amount,
    DENSE_RANK() OVER(ORDER BY amount DESC) AS rnk
  FROM cloud_costs
)
WHERE rnk = 2
LIMIT 1
