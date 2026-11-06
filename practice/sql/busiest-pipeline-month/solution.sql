SELECT
  TO_CHAR(start_at, 'MM') AS month,
  COUNT(DISTINCT pipe_id) AS pipeline_runs
FROM data_pipes
WHERE dur_secs IS NOT NULL
GROUP BY TO_CHAR(start_at, 'MM')
ORDER BY pipeline_runs DESC
LIMIT 1
