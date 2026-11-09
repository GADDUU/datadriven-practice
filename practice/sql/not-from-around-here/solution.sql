SELECT
  user_id,
  username,
  email
FROM users
WHERE email LIKE '%@example.com'
ORDER BY user_id
