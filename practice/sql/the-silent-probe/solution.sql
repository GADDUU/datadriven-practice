SELECT
  check_id,
  svc_name,
  status,
  CAST(latency AS INTEGER) AS latency,
  uptime,
  checked,
  region
FROM svc_health
WHERE latency IS NOT NULL
ORDER BY check_id
