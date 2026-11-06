SELECT
  job_name,
  ROW_NUMBER() OVER(ORDER BY total_rows DESC) rnk
FROM (
  SELECT
    job_name,
    SUM(rows_done) AS total_rows
  FROM batch_jobs
  GROUP BY job_name 
)
LIMIT 5
