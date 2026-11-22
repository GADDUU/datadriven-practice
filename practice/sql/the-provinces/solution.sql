SELECT
  region,
  SUM(profit) AS total_profit
FROM orders
WHERE region <> 'US'
GROUP BY region
ORDER BY total_profit DESC
LIMIT 3
