SELECT
  region,
  AVG(uptime) AS avg_uptime
FROM svc_health
GROUP BY region
ORDER BY avg_uptime DESC
