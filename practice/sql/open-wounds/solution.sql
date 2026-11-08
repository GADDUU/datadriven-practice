SELECT
  svc_name,
  alert_id,
  severity,
  status,
  fired_at
FROM (
  SELECT
    svc_name,
    alert_id,
    severity,
    status,
    fired_at,
    ROW_NUMBER() OVER(PARTITION BY svc_name ORDER BY fired_at) AS rnk
  FROM alert_events
  WHERE resolved IS NULL
)
WHERE rnk = 1
