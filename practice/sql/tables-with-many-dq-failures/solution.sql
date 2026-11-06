SELECT
  tbl_name,
  COUNT(*) FILTER(WHERE passed = 0) AS fail_count
FROM dq_checks
WHERE TO_CHAR(run_at, 'YYYY-MM-DD') >= '2026-04-01'
GROUP BY tbl_name
HAVING COUNT(*) FILTER(WHERE passed = 0) >= 3
