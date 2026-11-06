SELECT
  EXTRACT(YEAR FROM bill_date) AS year,
  SUM(amount) AS total_spend
FROM cloud_costs
GROUP BY year
ORDER BY year
