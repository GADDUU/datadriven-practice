SELECT
  pipe_name,
  AVG(rows_out) AS avg_rows_out
FROM data_pipes
WHERE dur_secs < 2700
GROUP BY pipe_name
ORDER BY avg_rows_out DESC
