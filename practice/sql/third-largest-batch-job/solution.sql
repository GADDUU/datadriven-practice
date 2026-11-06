SELECT
  job_name,
  SUM(rows_done) AS total_rows
FROM batch_jobs
GROUP BY job_name
ORDER BY total_rows DESC
LIMIT 3
