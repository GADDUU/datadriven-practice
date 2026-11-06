SELECT
  ABS(engineering_highest - marketing_highest) AS absolute_difference
FROM (
  SELECT
    MAX(metric_value) FILTER(WHERE department = 'Engineering') AS engineering_highest,
    MAX(metric_value) FILTER(WHERE department = 'Marketing') AS marketing_highest
  FROM employee_metrics
)
