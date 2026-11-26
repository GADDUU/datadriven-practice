WITH ranked_rows AS (
  SELECT
    TO_CHAR(started, 'YYYY-MM-DD') AS job_date,
    job_name,
    rows_done,
    ROW_NUMBER() OVER(PARTITION BY TO_CHAR(started, 'YYYY-MM-DD') ORDER BY rows_done DESC) AS rnk
  FROM batch_jobs
  WHERE rows_done IS NOT NULL
)

SELECT
  job_date,
  job_name,
  rows_done
FROM ranked_rows
WHERE rnk = 1
ORDER BY job_date
