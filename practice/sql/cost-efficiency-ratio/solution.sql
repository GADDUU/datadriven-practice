SELECT
  svc_name, 
  CAST(AVG(amount) AS INTEGER) AS avg_charge_dollars
FROM cloud_costs
WHERE amount > 0
GROUP BY svc_name
