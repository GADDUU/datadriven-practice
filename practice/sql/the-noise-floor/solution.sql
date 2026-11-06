SELECT
  svc_name,
  ROUND(high_critical_count * 100.0 / total_count, 1) AS urgent_pct
FROM (
  SELECT
    svc_name,
    COUNT(*) FILTER (
      WHERE LOWER(severity) = 'critical'
    ) AS critical_count,
    COUNT(*) FILTER (
      WHERE LOWER(severity) IN ('critical', 'high')
    ) AS high_critical_count,
    COUNT(*) AS total_count
  FROM alert_events
  GROUP BY svc_name
) AS service_stats
WHERE critical_count * 1.0 / NULLIF(high_critical_count, 0) > 0.8
ORDER BY urgent_pct DESC, svc_name
