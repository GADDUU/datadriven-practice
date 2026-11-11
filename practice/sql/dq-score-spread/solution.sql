WITH table_scores AS (
  SELECT
    tbl_name,
    SUM(fail_pct) AS total_fail
  FROM dq_checks
  GROUP BY tbl_name
)

SELECT
  MAX(total_fail) - MIN(total_fail) AS dq_spread
FROM table_scores
