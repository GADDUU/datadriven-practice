SELECT DISTINCT
  user_id
FROM user_sessions
WHERE EXTRACT(MONTH FROM session_start) IN (4, 5) 
ORDER BY user_id ASC
