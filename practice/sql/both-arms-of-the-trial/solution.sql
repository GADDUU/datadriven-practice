SELECT
  exp_name
FROM (
  SELECT
    exp_name,
    COUNT(*) FILTER(WHERE variant = 'variant_a') AS a_count,
    COUNT(*) FILTER(WHERE variant = 'variant_b') AS b_count
  FROM experiments
  GROUP BY exp_name
)
WHERE a_count > b_count
