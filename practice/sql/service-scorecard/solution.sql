WITH CTE1 AS (
  SELECT
    svc_name,
    COUNT(alert_id) AS alert_count
  FROM alert_events
  GROUP BY svc_name
),
CTE2 AS (
  SELECT
    svc_name,
    COUNT(assignment_id) AS assignment_count
  FROM pod_assignments
  GROUP BY svc_name      
)

SELECT
  c2.svc_name,
  c2.assignment_count,
  COALESCE(c1.alert_count, 0)
FROM CTE2 AS c2
LEFT JOIN CTE1 AS c1
  ON c2.svc_name = c1.svc_name
