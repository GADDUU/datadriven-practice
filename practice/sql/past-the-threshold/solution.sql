SELECT
  u.user_id,
  COUNT(s.session_id) AS session_count
FROM users AS u
INNER JOIN user_sessions AS s
  ON u.user_id = s.user_id
GROUP BY u.user_id
HAVING session_count > 3
ORDER BY u.user_id
