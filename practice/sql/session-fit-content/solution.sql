WITH user_avg_session AS (
  SELECT
    user_id,
    AVG(session_duration_sec) AS avg_session_duration
  FROM user_sessions
  WHERE user_id = 197
  GROUP BY user_id
)

SELECT
  u.user_id,
  c.content_id,
  c.duration_seconds AS content_duration
FROM content_items AS c
CROSS JOIN user_avg_session AS u
WHERE c.duration_seconds IS NOT NULL
  AND c.duration_seconds <= u.avg_session_duration
