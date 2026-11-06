SELECT
  COUNT(*) AS low_severity_count
FROM dq_checks
WHERE EXTRACT(YEAR FROM run_at) = 2026
  AND LOWER(severity) = 'low'
