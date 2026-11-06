WITH ranked_rows AS (
  SELECT
    job_id,
    job_name,
    priority,
    rows_done,
    PERCENT_RANK() OVER(ORDER BY rows_done ASC) AS rnk
  FROM batch_jobs
)

SELECT
  *
FROM ranked_rows
WHERE rnk >= 0.95
