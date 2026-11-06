SELECT
  svc_name,
  COUNT(*) AS occurrence_count,
  DENSE_RANK() OVER(ORDER BY COUNT(*) DESC)
FROM alert_events
GROUP BY svc_name
