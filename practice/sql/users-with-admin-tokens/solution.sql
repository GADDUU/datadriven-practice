SELECT DISTINCT
  u.user_id,
  u.username,
  u.email,
  a.token_id,
  a.scope
FROM users AS u
INNER JOIN api_tokens AS a
  ON u.user_id = a.owner_id
WHERE scope LIKE '%admin%'
ORDER BY u.user_id, a.issued
