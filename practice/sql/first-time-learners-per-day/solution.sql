WITH pre_solve AS (
  SELECT
    MIN(CAST(session_start AS DATE)) AS first_session_date,
    COUNT(DISTINCT user_id) AS new_user_count
  FROM user_sessions
  GROUP BY user_id
  ORDER BY new_user_count DESC, first_session_date
)
  
SELECT
  first_session_date,
  COUNT(*) AS new_user_count
FROM pre_solve
GROUP BY first_session_date
ORDER BY new_user_count DESC, first_session_date
