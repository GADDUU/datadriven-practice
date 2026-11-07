SELECT
  ack_by,
  COUNT(resolved) AS resolved_count
FROM alert_events
WHERE ack_by IS NOT NULL
GROUP BY ack_by
ORDER BY resolved_count DESC, ack_by ASC
LIMIT 3
