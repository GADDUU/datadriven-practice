SELECT
  outcome,
  COUNT(*) AS cnt
FROM experiments
WHERE EXTRACT(DOW FROM created) = 1
GROUP BY outcome
ORDER BY cnt DESC
