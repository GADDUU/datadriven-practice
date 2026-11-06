SELECT
  TO_CHAR(session_start, 'YYYY-MM') AS activity_month,
  COUNT(DISTINCT user_id) AS unique_visitors,
  COUNT(session_id) AS session_count
FROM user_sessions
GROUP BY TO_CHAR(session_start, 'YYYY-MM')
HAVING COUNT(session_id) > COUNT(DISTINCT user_id)
