SELECT
  svc_name,
  COUNT(alert_id) AS total_alerts,
  COUNT(*) FILTER(WHERE LOWER(severity) = 'critical') AS critical_count,
  COUNT(*) FILTER(WHERE LOWER(severity) = 'high') AS high_count,
  COUNT(*) FILTER(WHERE ack_by IS NULL) AS unacked_count,
  ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT status), 2) AS avg_per_status
FROM alert_events
GROUP BY svc_name
ORDER BY total_alerts DESC, svc_name
