SELECT
  user_id,
  SUM(pages_viewed) AS total_pages
FROM user_sessions
GROUP BY user_id
ORDER BY total_pages DESC, user_id
LIMIT 5
