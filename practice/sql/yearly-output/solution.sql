SELECT
  EXTRACT(YEAR FROM publish_date) AS year,
  COUNT(*) AS items_published,
  AVG(duration_seconds) AS avg_duration
FROM content_items
WHERE year IS NOT NULL
GROUP BY year
