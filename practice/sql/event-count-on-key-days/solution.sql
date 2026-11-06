SELECT
  EXTRACT(DOW FROM event_timestamp) AS day_of_week,
  COUNT(*) AS event_count
FROM event_data
WHERE EXTRACT(DOW FROM event_timestamp) IN (0, 1, 6)
GROUP BY day_of_week
