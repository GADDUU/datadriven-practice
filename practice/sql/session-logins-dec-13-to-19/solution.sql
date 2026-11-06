SELECT DISTINCT user_id
FROM user_sessions
WHERE session_start >= TIMESTAMP '2026-12-13 00:00:00'
  AND session_start < TIMESTAMP '2026-12-20 00:00:00';
