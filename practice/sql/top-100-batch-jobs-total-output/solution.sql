WITH ranked_rows_done AS (
  SELECT
    rows_done,
    DENSE_RANK() OVER(ORDER BY rows_done DESC) AS rnk
  FROM batch_jobs
)
  
SELECT
  SUM(rows_done) AS total_rows
FROM ranked_rows_done
WHERE rnk <= 10
