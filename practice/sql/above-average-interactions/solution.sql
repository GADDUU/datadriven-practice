SELECT
  user_id,
  COUNT(session_id) AS total_sessions
FROM user_sessions
GROUP BY user_id
HAVING COUNT(*) > (
  SELECT
    AVG(cnt)
  FROM (
    SELECT
      COUNT(*) AS cnt
    FROM user_sessions
    GROUP BY user_id
  ) AS sub
)
ORDER BY total_sessions DESC, user_id
