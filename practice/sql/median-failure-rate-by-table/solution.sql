SELECT
  LOWER(TRIM(tbl_name)) AS tbl_name,
  ROUND(
    CAST(
      (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fail_pct))
      AS NUMERIC
    )
  ) AS median_fail_pct
FROM dq_checks
GROUP BY LOWER(TRIM(tbl_name))
ORDER BY tbl_name
