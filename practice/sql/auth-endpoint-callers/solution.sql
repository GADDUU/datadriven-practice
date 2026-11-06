SELECT
  u.user_id,
  u.username,
  u.email,
  ac.call_id,
  ac.endpoint
FROM users AS u
INNER JOIN api_calls AS ac
  ON u.user_id = ac.user_id
WHERE ac.endpoint LIKE '%auth%'
ORDER BY u.user_id, ac.call_id
