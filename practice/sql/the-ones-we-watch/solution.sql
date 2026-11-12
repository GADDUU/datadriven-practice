SELECT
  et.svc_name,
  SUM(et.count) AS total_errors
FROM err_tracks AS et
WHERE EXISTS (
  SELECT
    1
  FROM alert_events AS ae
  WHERE et.svc_name = ae.svc_name
)
GROUP BY et.svc_name
ORDER BY total_errors DESC
