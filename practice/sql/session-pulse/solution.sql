SELECT
  user_id,
  AVG(session_duration_sec) AS avg_duration,
  COUNT(session_id) AS session_count,
  MAX(session_duration_sec) AS longest
FROM user_sessions
WHERE session_duration_sec IS NOT NULL
GROUP BY user_id
HAVING COUNT(session_id) >= 3
ORDER BY avg_duration DESC
