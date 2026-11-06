SELECT
  u.account_status,
  AVG(us.session_duration_sec) AS avg_session_duration
FROM users AS u
INNER JOIN user_sessions AS us
  ON u.user_id = us.user_id
GROUP BY u.account_status
