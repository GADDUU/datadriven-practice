SELECT
  TO_CHAR(session_start, 'YYYY-MM-DD') AS session_date,
  COUNT(*) AS total_sessions,
  COUNT(DISTINCT user_id) AS unique_users
FROM user_sessions
GROUP BY session_date
ORDER BY session_date
