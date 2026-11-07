SELECT
  cv.view_id,
  cv.user_id,
  u.username
FROM content_views AS cv
INNER JOIN users AS u
  ON cv.user_id = u.user_id
