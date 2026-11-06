SELECT
  LOWER(status),
  AVG(latency) AS avg_latency
FROM svc_health
GROUP BY LOWER(status)
ORDER BY avg_latency DESC
