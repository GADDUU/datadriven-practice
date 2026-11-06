SELECT
  COUNT(DISTINCT u.user_id) AS users_with_errors
FROM users AS u
INNER JOIN api_calls AS a
  ON u.user_id = a.user_id
WHERE a.status >= 400
