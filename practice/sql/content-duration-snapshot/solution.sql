SELECT
  content_id,
  title,
  duration_seconds
FROM content_items
ORDER BY duration_seconds DESC, content_id ASC
