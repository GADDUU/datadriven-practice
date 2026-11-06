SELECT
  tbl_name,
  COUNT(*) FILTER(WHERE passed = 0) AS fail_count
FROM dq_checks
GROUP BY tbl_name
ORDER BY fail_count DESC
