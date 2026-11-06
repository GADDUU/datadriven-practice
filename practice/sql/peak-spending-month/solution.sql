SELECT
  TO_CHAR(bill_date, 'YYYY-MM') AS billing_month,
  SUM(amount) AS total_spend
FROM cloud_costs
GROUP BY billing_month
ORDER BY total_spend DESC
LIMIT 1
