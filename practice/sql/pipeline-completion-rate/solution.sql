SELECT
  pipe_name,
  AVG(rows_in) AS avg_input_rows
FROM data_pipes
WHERE rows_out >= 3000
GROUP BY pipe_name
ORDER BY pipe_name
