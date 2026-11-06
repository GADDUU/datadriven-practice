SELECT
  u.username,
  COUNT(s.session_id),
  MAX(s.session_duration_sec)
FROM users AS u
LEFT JOIN user_sessions AS s
  ON u.user_id = s.user_id
GROUP BY u.username
