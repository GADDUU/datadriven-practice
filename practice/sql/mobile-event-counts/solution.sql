SELECT
  event_type,
  COUNT(*) AS event_count
FROM event_data
WHERE tags LIKE '%mobile%'
GROUP BY event_type
