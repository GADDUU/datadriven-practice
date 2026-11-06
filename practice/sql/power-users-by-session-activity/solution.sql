SELECT
  u.user_id,
  u.username,
  COUNT(*) AS session_count,
  SUM(us.pages_viewed) AS total_pages
FROM users AS u
INNER JOIN user_sessions AS us
  ON u.user_id = us.user_id
WHERE LOWER(u.account_status) = 'active'
GROUP BY u.user_id
HAVING COUNT(*) >= 3
  AND AVG(us.pages_viewed) >= 25
ORDER BY total_pages DESC
