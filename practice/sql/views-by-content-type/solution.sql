SELECT
  ci.content_type,
  COUNT(*) AS view_count
FROM content_items AS ci
INNER JOIN content_views AS cv
  ON ci.content_id = cv.content_id
GROUP BY ci.content_type
