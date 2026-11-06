WITH sessions_per_users AS (
  SELECT
    user_id,
    COUNT(*) AS session_count
  FROM user_sessions
  GROUP BY user_id
)
  
SELECT
  AVG(session_count) AS avg_sessions_per_user
FROM sessions_per_users
