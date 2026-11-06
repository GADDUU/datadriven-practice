WITH review_mentors AS (
  SELECT
    review_id,
    repo_name,
    author,
    FIRST_VALUE(author) OVER (
      PARTITION BY repo_name
      ORDER BY opened_at, review_id
    ) AS mentor
  FROM code_reviews
)

SELECT
  review_id,
  repo_name,
  author,
  mentor
FROM review_mentors
ORDER BY repo_name, author, review_id
