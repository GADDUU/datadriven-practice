SELECT
  repo_name, 
  author,
  COUNT(*) AS fix_count
FROM repo_commits
WHERE LOWER(message) LIKE "%fix%"
GROUP BY author, repo_name
ORDER BY repo_name
