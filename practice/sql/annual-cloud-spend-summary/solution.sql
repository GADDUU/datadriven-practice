SELECT
  EXTRACT(YEAR FROM bill_date) AS fiscal_year,
  SUM(amount) AS total_spend,
  COUNT(DISTINCT svc_name) AS service_count
FROM cloud_costs
GROUP BY EXTRACT(YEAR FROM bill_date)
ORDER BY fiscal_year
