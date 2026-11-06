SELECT
  pipe_name,
  MIN(start_at) AS first_run,
  MAX(start_at) AS last_run,
  COUNT(DISTINCT TO_CHAR(start_at, 'YYYY-MM')) AS active_months
FROM data_pipes
GROUP BY pipe_name
