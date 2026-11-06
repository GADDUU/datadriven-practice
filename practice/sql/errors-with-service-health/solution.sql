SELECT
  e.err_id,
  e.err_type,
  e.message,
  e.svc_name,
  e.severity,
  e.count,
  e.first_at,
  s.status,
  s.latency,
  s.uptime
FROM err_tracks AS e
JOIN svc_health AS s
  ON e.svc_name = s.svc_name
WHERE s.check_id IS NOT NULL
