SELECT
  u.user_id,
  u.username,
  SUM(us.session_duration_sec) AS total_duration
FROM users AS u
INNER JOIN user_sessions AS us
  ON u.user_id = us.user_id
GROUP BY u.user_id
ORDER BY total_duration DESC
LIMIT 10
