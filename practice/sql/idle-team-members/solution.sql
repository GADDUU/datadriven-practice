SELECT
  u.user_id,
  u.username
FROM users AS u
LEFT JOIN user_sessions AS us
  ON u.user_id = us.user_id
WHERE us.user_id IS NULL
ORDER BY u.user_id
