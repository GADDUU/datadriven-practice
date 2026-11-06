WITH user_sessions1 AS (
  SELECT
    user_id,
    COUNT(*) AS session_count
  FROM user_sessions 
  GROUP BY user_id
)

SELECT
  session_count,
  COUNT(*) AS user_count
FROM user_sessions1 
GROUP BY session_count
ORDER BY session_count ASC
