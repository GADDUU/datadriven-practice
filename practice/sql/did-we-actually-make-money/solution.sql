SELECT
  region,
  SUM(profit) AS total_profit
FROM orders
WHERE status NOT ILIKE 'cancelled'
GROUP BY region
ORDER BY total_profit DESC
