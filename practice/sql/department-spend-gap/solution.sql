SELECT
  ABS(largest_engineering - largest_marketing) AS spend_gap
FROM (
  SELECT
    MAX(t.total_amount) FILTER(WHERE e.department = 'Engineering') AS largest_engineering,
    MAX(t.total_amount) FILTER(WHERE e.department = 'Marketing') AS largest_marketing
  FROM transactions AS t
  INNER JOIN employees AS e
    ON t.user_id = e.user_id
)
