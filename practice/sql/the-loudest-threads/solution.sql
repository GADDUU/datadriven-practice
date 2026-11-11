WITH ranked_avg_comments AS (
  SELECT
    repo_name,
    author,
    avg_comments,
    ROW_NUMBER() OVER(ORDER BY avg_comments DESC, review_id) AS rnk
  FROM (
    SELECT
      review_id,
      repo_name,
      author,
      AVG(comments) AS avg_comments
    FROM code_reviews
    GROUP BY review_id, repo_name, author
  )
)

SELECT
  repo_name,
  author
FROM ranked_avg_comments
WHERE rnk <= 3
