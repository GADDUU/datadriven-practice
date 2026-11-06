SELECT
  EXTRACT(YEAR FROM start_at) AS run_year,
  COUNT(*) AS failted_runs
FROM data_pipes
WHERE LOWER(status) = 'failed'
  AND dur_secs IS NOT NULL
GROUP BY run_year
ORDER BY run_year
