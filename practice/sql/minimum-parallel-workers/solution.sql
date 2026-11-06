WITH completed_jobs AS (
  SELECT
    job_id,
    MIN(started) AS start_time,
    MAX(ended) AS end_time
  FROM batch_jobs
  WHERE LOWER(status) = 'completed'
    AND started IS NOT NULL
    AND ended IS NOT NULL
  GROUP BY job_id
),
job_events AS (
  -- Job starts: demands 1 worker
  SELECT
    start_time AS event_time,
    1 AS change
  FROM completed_jobs

  UNION ALL

  -- Job ends: releases 1 worker
  SELECT
    end_time AS event_time,
    - 1 AS change
  FROM completed_jobs
),
concurrent_workers AS (
  SELECT
    event_time,
    SUM(change) OVER (
      ORDER BY event_time, change
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS active_workers
  FROM job_events
)

SELECT
  COALESCE(MAX(active_workers), 0) AS smallest_pool_size
FROM concurrent_workers
