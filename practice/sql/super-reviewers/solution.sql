SELECT
  reviewer,
  COUNT(review_id) AS review_count
FROM code_reviews
WHERE merged IS NOT NULL
GROUP BY reviewer
HAVING COUNT(review_id) >= 25
ORDER BY review_count DESC
