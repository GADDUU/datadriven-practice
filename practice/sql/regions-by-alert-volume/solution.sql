SELECT
  sh.region,
  COUNT(ae.alert_id) AS alert_count
FROM svc_health AS sh
INNER JOIN alert_events AS ae
  ON sh.svc_name = ae.svc_name
GROUP BY sh.region
ORDER BY alert_count DESC, sh.region ASC
