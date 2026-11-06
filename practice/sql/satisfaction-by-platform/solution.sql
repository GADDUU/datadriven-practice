SELECT
  e.platform,
  ROUND(AVG(CAST(e.outcome AS INTEGER)), 0) AS avg_outcome_score
FROM experiments AS e
LEFT JOIN users AS u
  ON e.user_id = u.user_id
WHERE u.age_bucket = '25-34'
GROUP BY e.platform
ORDER BY e.platform
