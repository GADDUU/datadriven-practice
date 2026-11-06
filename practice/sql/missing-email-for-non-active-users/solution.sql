SELECT
  user_id,
  EXTRACT(YEAR FROM signup_date) AS signup_year
FROM users
WHERE (LENGTH(email) = 0
  OR email IS NULL
  OR age_bucket IS NULL)
  AND LOWER(account_status) <> 'active'
