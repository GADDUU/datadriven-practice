SELECT
  tbl_name,
  COUNT(*) FILTER(WHERE passed = 0) AS failing_checks,
  COUNT(*) FILTER(WHERE LOWER(severity) IN ('critical', 'high') AND passed = 0) AS high_severity_failures
FROM dq_checks
GROUP BY tbl_name
ORDER BY failing_checks DESC, tbl_name
