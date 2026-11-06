SELECT
  *
FROM alert_events
WHERE LOWER(severity) IN ('high', 'critical')
  AND EXTRACT(YEAR FROM fired_at) >= 2026
