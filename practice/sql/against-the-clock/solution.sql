SELECT
  job_id,
  job_name,
  CAST(
    EXTRACT(EPOCH FROM (
      ended - started
    )) / 60
    AS INTEGER
  ) AS minutes_elapsed
FROM batch_jobs
WHERE ended IS NULL
  OR ended < started
ORDER BY job_id
