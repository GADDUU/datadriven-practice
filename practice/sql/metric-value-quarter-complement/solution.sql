SELECT
  *
FROM employee_metrics
WHERE CAST(metric_value AS INTEGER) + CAST(SUBSTRING(fiscal_quarter, 2) AS INTEGER) = 5
ORDER BY metric_id
