SELECT
  user_id,
  ROUND(CAST(SUM(session_duration_sec) AS DOUBLE) / COUNT(session_id), 3) AS avg_session_duration
FROM user_sessions
WHERE session_duration_sec IS NOT NULL
GROUP BY user_id
