SELECT
  COUNT(title) FILTER(WHERE LOWER(title) LIKE '%how%') AS howto_count
FROM content_items
