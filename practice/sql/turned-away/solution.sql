SELECT
  client
FROM (
  SELECT
    client,
    COUNT(blocked) * 100 / COUNT(*) AS pct
  FROM rate_limits
  GROUP BY client
  HAVING pct > 25
)
