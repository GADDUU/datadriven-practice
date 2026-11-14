SELECT
  repo_name,
  total_added,
  DENSE_RANK() OVER(ORDER BY total_added DESC) AS rank
FROM (
  SELECT
    repo_name,
    SUM(added) AS total_added
  FROM repo_commits
  GROUP BY repo_name
)
