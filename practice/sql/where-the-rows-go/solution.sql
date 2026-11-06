SELECT
  pipe_name,
  start_at,
  ROUND(CAST(NULLIF(rows_out, -1) AS double) / rows_in, 4) AS throughput_ratio
FROM data_pipes
ORDER BY pipe_name, start_at
