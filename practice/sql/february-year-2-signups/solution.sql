SELECT
  *
FROM users
WHERE TO_CHAR(signup_date, 'YYYY-MM') = '2025-02'
