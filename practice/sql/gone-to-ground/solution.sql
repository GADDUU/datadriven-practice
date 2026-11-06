SELECT
  u.user_id,
  u.age_bucket,
  e.platform,
  e.variant
FROM users AS u
LEFT JOIN experiments AS e
  ON u.user_id = e.user_id
WHERE LOWER(platform) = 'android'
  AND variant = 'control'
  AND u.account_status = 'inactive'
