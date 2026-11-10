SELECT
  ci.creator_id,
  AVG(cv.watch_seconds) AS avg_watch_seconds
FROM content_items AS ci
LEFT JOIN content_views AS cv
  ON cv.content_id = ci.content_id
GROUP BY ci.creator_id
ORDER BY ci.creator_id
