SELECT
  COUNT(*) AS fail_count
FROM dq_checks
WHERE LOWER(rule) = 'not_null'
  AND passed = 0
