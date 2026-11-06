SELECT
  EXTRACT(MONTH FROM event_timestamp) AS month,
  COUNT(*) AS event_count
FROM event_data
GROUP BY month
