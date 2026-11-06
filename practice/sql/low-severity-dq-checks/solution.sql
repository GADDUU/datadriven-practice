SELECT
  *
FROM dq_checks
WHERE LOWER(severity) = 'low'
