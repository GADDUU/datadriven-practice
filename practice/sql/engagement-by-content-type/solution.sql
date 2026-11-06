SELECT
  content_type,
  SUM(COALESCE(duration_seconds, 0)) AS total_duration,
  COUNT(*) item_count
FROM content_items
GROUP BY content_type
ORDER BY total_duration DESC
