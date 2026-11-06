SELECT
  COUNT(*) FILTER(WHERE LOWER(severity) = 'low') AS low_severity_count
FROM dq_checks
WHERE EXTRACT(YEAR FROM run_at) = 2026
