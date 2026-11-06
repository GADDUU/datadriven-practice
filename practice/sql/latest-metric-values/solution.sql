WITH ranking AS (
  SELECT
    department,
    metric_name,
    metric_value,
    ROW_NUMBER() OVER(PARTITION BY department, metric_name ORDER BY metric_value DESC) AS rnk
  FROM employee_metrics 
)
  
SELECT
  department,
  metric_name,
  metric_value
FROM ranking
WHERE rnk = 1
