SELECT
  status,
  COUNT(job_id) AS occurrences
FROM batch_jobs
WHERE job_name LIKE '%export%'
GROUP BY status
