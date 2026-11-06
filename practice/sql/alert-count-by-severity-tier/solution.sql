SELECT
  COALESCE(ack_by, 'unassigned') AS responder,
  COUNT(*) AS alert_count
FROM alert_events
GROUP BY COALESCE(ack_by, 'unassigned')
ORDER BY alert_count DESC, responder
