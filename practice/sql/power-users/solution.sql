SELECT
  u.username,
  COUNT(*) AS session_count
FROM users AS u
INNER JOIN user_sessions AS us
  ON u.user_id = us.user_id
GROUP BY u.username
HAVING COUNT(*) >= 3
ORDER BY session_count DESC
