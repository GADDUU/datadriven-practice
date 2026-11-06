SELECT DISTINCT
  pipe_name
FROM data_pipes
WHERE rows_out < 0
