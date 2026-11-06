WITH target_pipe AS (
  SELECT
    pipe_name,
    TO_CHAR(start_at, 'YYYY-MM-DD') AS day,
    dur_secs
  FROM data_pipes
  WHERE TO_CHAR(start_at, 'YYYY-MM-DD') >= '2026-01-01'
    AND LOWER(status) = 'success'
)

SELECT
  tp.pipe_name,
  bj.priority,
  MIN(tp.dur_secs) AS min_duration,
  AVG(tp.dur_secs) AS avg_duration,
  MAX(tp.dur_secs) AS max_duration
FROM target_pipe AS tp
INNER JOIN batch_jobs AS bj
  On tp.day = TO_CHAR(bj.started, 'YYYY-MM-DD')
GROUP BY tp.pipe_name, bj.priority
