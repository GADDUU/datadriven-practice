SELECT
  u.user_id,
  u.username,
  u.email,
  u.signup_date,
  u.account_status,
  u.age_bucket
FROM users AS u
LEFT JOIN user_sessions AS s
  ON u.user_id = s.user_id
    AND strftime('%Y-%m', s.session_start) = '2026-03'
WHERE s.session_id IS NULL
  AND u.account_status = 'pending_verification'
ORDER BY u.user_id
