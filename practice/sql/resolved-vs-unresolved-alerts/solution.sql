SELECT
  svc_name,
  COUNT(resolved) AS resolved_count,
  COUNT(*) FILTER(WHERE resolved IS NULL) AS unresolved_count
FROM alert_events
GROUP BY svc_name
