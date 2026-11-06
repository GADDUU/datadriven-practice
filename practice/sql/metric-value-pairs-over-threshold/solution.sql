SELECT
  a.metric_value AS metric_value_1,
  g.metric_value AS metric_value_2
FROM employee_metrics AS a
JOIN employee_metrics AS g
  ON a.metric_value < g.metric_value
WHERE a.metric_value * g.metric_value > 11
ORDER BY a.metric_value ASC, g.metric_value ASC
