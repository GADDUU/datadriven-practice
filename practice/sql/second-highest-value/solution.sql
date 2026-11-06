SELECT
  metric_value
FROM (
  SELECT
    metric_value,
    DENSE_RANK() OVER(ORDER BY metric_value DESC) AS rnk
  FROM employee_metrics
)
WHERE rnk = 2
LIMIT 1
