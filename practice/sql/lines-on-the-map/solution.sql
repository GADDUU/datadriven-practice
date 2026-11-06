SELECT
  o.region, 
  COUNT(o.order_id) AS order_count,
  SUM(o.profit) AS total_profit
FROM orders AS o
WHERE region IS NOT NULL
GROUP BY o.region
HAVING AVG(o.profit) > 740
