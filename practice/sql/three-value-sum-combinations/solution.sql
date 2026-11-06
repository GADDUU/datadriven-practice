SELECT
  e1.metric_value AS val1,
  e2.metric_value AS val2,
  e3.metric_value AS val3
FROM employee_metrics AS e1
INNER JOIN employee_metrics AS e2
  ON e2.metric_id > e1.metric_id
INNER JOIN employee_metrics AS e3
  ON e3.metric_id > e2.metric_id
WHERE e1.metric_value + e2.metric_value + e3.metric_value = 25
