SELECT
  region,
  status,
  COUNT(order_id) AS order_count
FROM orders
WHERE region IS NOT NULL
  AND status IS NOT NULL
GROUP BY region, status
HAVING COUNT(order_id) >= 3
ORDER BY order_count DESC
