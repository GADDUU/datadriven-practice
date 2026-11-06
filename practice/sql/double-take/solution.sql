SELECT
  tbl_name,
  col_name,
  duplicate_count, 
  RANK() OVER(ORDER BY duplicate_count DESC) AS dup_rank,
  ROUND(
    duplicate_count * 100 / SUM(duplicate_count) OVER()
  ) AS pct_of_dups
FROM (
  SELECT
    tbl_name,
    col_name,
    COUNT(*) AS duplicate_count
  FROM dq_checks
  GROUP BY tbl_name, col_name
) AS CTE
