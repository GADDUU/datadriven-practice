SELECT
  user_id,
  AVG(session_duration_sec) AS avg_duration
FROM user_sessions
GROUP BY user_id
HAVING avg_duration < 1000
