SELECT
  TO_CHAR(bill_date, 'YYYY-MM') AS month,
  COALESCE(SUM(amount) FILTER(WHERE LOWER(provider) = 'aws'), 0) AS aws_total,
  COALESCE(SUM(amount) FILTER(WHERE LOWER(provider) = 'gcp'), 0) AS gcp_total,
  COALESCE(SUM(amount) FILTER(WHERE LOWER(provider) = 'azure'), 0) AS azure_total
FROM cloud_costs
GROUP BY month
ORDER BY month ASC
