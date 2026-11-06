SELECT
  job_name,
  total_rows,
  CASE 
    WHEN total_rows > 700000000 THEN 'Outstanding'
    WHEN total_rows BETWEEN 350000000 AND 700000000 THEN 'Satisfactory'
    WHEN total_rows BETWEEN 200000000 AND 350000000 THEN 'Unsatisfactory'
    ELSE 'Poor'
  END AS performance_tier
FROM (
  SELECT
    job_name,
    SUM(rows_done) AS total_rows
  FROM batch_jobs
  GROUP BY job_name
) AS CTE
