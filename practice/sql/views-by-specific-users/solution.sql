SELECT
  cv.view_id,
  cv.content_id,
  cv.viewed_at,
  cv.watch_seconds
FROM content_views AS cv
JOIN users AS u
  ON cv.user_id = u.user_id
WHERE u.username LIKE 'a%'
ORDER BY cv.viewed_at
