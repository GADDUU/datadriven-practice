SELECT
  content_type,
  COUNT(content_id) AS published_items 
FROM content_items
WHERE publish_date IS NOT NULL
GROUP BY content_type
ORDER BY published_items DESC
