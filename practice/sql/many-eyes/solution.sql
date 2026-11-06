SELECT
  repo_name,
  EXTRACT(YEAR FROM opened_at) AS review_year,
  COUNT(DISTINCT reviewer) AS reviewer_count
FROM code_reviews
GROUP BY repo_name, EXTRACT(YEAR FROM opened_at)
ORDER BY repo_name, review_year
