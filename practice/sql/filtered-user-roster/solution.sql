SELECT
  *
FROM users
WHERE LOWER(account_status) NOT IN ('suspended', 'pending_verification')
  AND (email NOT LIKE '%z%'
    OR email IS NULL)
ORDER BY username
