SELECT
  u.username
FROM users AS u
WHERE NOT EXISTS (
  SELECT
    1
  FROM user_sessions AS s
  WHERE s.user_id = u.user_id
    AND s.session_start >= '2026-06-01'
    AND s.session_start < '2026-07-01'
)
