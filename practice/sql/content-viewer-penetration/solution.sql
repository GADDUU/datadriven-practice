SELECT
  COUNT(DISTINCT c.user_id) * 100 / COUNT(DISTINCT u.user_id) AS viewer_pct
FROM users AS u
LEFT JOIN content_views AS c
  ON u.user_id = c.user_id
