SELECT
  tbl_name,
  COUNT(*) FILTER(WHERE passed = 0) AS failure_count,
  MAX(fail_pct) AS max_fail_pct
FROM dq_checks
GROUP BY tbl_name
ORDER BY failure_count DESC, tbl_name ASC
