SELECT
  job_id
FROM batch_jobs
WHERE priority = 1
  AND LOWER(status) = 'completed'
