SELECT
  tbl_name,
  1.0 * SUM(passed) / COUNT(*) AS pass_rate
FROM dq_checks
WHERE fail_pct IS NOT NULL
GROUP BY tbl_name
ORDER BY tbl_name
