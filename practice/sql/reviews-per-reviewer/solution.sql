SELECT
  reviewer,
  COUNT(review_id) AS review_count
FROM code_reviews
GROUP BY reviewer
