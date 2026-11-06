SELECT
  CAST(session_start AS DATE) AS day,
  COUNT(DISTINCT user_id) AS dau
FROM user_sessions
GROUP BY CAST(session_start AS DATE)
ORDER BY day
