SELECT
  *
FROM alert_events
WHERE EXTRACT(YEAR FROM fired_at) >= 2026
  AND LOWER(severity) IN ('high', 'critical')
