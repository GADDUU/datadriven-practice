SELECT
  client,
  SUM(blocked) AS total_blocked
FROM rate_limits
WHERE endpoint = '/api/v1/auth'
GROUP BY client
ORDER BY total_blocked DESC
LIMIT 2
