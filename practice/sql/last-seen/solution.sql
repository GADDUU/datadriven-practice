SELECT
  user_id,
  MAX(session_start) AS latest_session_start
FROM user_sessions
GROUP BY user_id
ORDER BY user_id
