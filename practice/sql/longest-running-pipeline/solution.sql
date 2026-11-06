SELECT
  pipe_name
FROM (
  SELECT
    pipe_name,
    ROW_NUMBER() OVER(ORDER BY dur_secs DESC) AS rn
  FROM data_pipes
)
  WHERE rn = 1
