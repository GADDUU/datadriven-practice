SELECT
  ci.content_type,
  AVG(cv.watch_seconds) AS avg_watch_time
FROM content_items AS ci
INNER JOIN content_views AS cv
  ON ci.content_id = cv.content_id
GROUP BY ci.content_type
ORDER BY ci.content_type
