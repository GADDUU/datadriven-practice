SELECT
  department,
  MAX(metric_value) AS max_value
FROM employee_metrics
GROUP BY department
