WITH control_avg AS (
  SELECT
    test_name,
    AVG(value) AS avg_control_value
  FROM ab_results
  WHERE LOWER(variant) = 'control'
  GROUP BY test_name
),
treatment AS (
  SELECT
    test_name,
    user_id,
    AVG(value) AS treatment_value
  FROM ab_results
  WHERE variant = 'treatment_a'
  GROUP BY test_name, user_id
)

SELECT
  t.user_id,
  t.treatment_value,
  c.avg_control_value
FROM treatment AS t
INNER JOIN control_avg AS c
  ON t.test_name = c.test_name
WHERE t.treatment_value > c.avg_control_value
ORDER BY t.user_id
