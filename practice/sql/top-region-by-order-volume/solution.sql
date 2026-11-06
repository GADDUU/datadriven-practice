SELECT
  region,
  COUNT(order_id) AS order_count
FROM orders 
WHERE region IS NOT NULL
GROUP BY region
ORDER BY order_count, region DESC
LIMIT 1
