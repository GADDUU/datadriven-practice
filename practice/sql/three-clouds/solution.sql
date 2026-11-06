SELECT
  amount
FROM cloud_costs
WHERE LOWER(provider) IN ('gcp', 'azure')
ORDER BY amount
