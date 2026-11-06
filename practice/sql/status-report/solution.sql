SELECT
  status,
  COUNT(order_id) AS order_count,
  AVG(profit) AS avg_profit
FROM orders
WHERE region IS NOT NULL
GROUP BY status
HAVING COUNT(order_id) >= 24
ORDER BY avg_profit DESC
