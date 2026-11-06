SELECT
  content_type,
  COUNT(content_id) AS items_published,
  AVG(duration_seconds) AS avg_runtime
FROM content_items
GROUP BY content_type
ORDER BY avg_runtime DESC
