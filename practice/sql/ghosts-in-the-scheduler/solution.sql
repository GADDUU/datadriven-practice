SELECT
  SUM(
    CASE
      WHEN EXTRACT(YEAR FROM started) = 2025 AND ended IS NULL AND status = 'running' THEN 1
      ELSE 0
    END
  ) AS stuck_running_count
FROM batch_jobs
