SELECT
  *
FROM user_sessions
WHERE EXTRACT(DOW FROM session_start) IN (1, 6)
