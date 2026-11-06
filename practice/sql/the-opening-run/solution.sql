WITH ranked_time AS (
  SELECT
    job_name,
    rows_done,
    started,
    ROW_NUMBER() OVER(PARTITION BY job_name ORDER BY started ASC) AS rnk
  FROM batch_jobs
)
  
SELECT
  job_name,
  rows_done
FROM ranked_time
WHERE rnk = 1
ORDER BY job_name
