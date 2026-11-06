WITH ranked_rows_out AS (
  SELECT
    DATE_TRUNC(QUARTER, start_at) AS quarter_start,
    rows_out,
    ROW_NUMBER() OVER(PARTITION BY DATE_TRUNC(QUARTER, start_at) ORDER BY rows_out DESC) AS rnk
  FROM data_pipes
  WHERE EXTRACT(YEAR FROM start_at) = 2025
)
  
SELECT
  TO_CHAR(quarter_start, 'YYYY-MM') AS quarter_start,
  rows_out AS peak_rows_out
FROM ranked_rows_out
WHERE rnk = 1
