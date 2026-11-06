SELECT
  *
FROM content_items
WHERE title LIKE '%s'
ORDER BY title, content_id
