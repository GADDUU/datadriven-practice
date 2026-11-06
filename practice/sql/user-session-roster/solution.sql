SELECT
  u.username,
  u.account_status,
  u.signup_date,
  s.session_start
FROM users AS u
LEFT JOIN user_sessions AS s
  ON u.user_id = s.user_id
ORDER BY u.username, s.session_start
