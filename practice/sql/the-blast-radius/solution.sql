SELECT
  LOWER(d.author) AS author,
  ROUND(AVG(s.latency), 2) AS avg_score
FROM deploy_logs AS d
INNER JOIN svc_health AS s
  ON d.svc_name = s.svc_name
GROUP BY LOWER(d.author)
ORDER BY avg_score DESC
