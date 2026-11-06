SELECT
  COUNT(*) AS total_commits,
  COUNT(DISTINCT LOWER(TRIM(author))) AS distinct_authors
FROM repo_commits
