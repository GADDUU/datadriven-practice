SELECT
  LOWER(author) AS author, 
  repo_name,
  ROUND(AVG(len(TRIM(message))), 2) AS avg_msg_len,
  COUNT(*) AS commit_count,
  ROUND(AVG(added), 2) AS avg_lines_added
FROM repo_commits
WHERE message IS NOT NULL
GROUP BY LOWER(author), repo_name
HAVING COUNT(*) > 2
ORDER BY avg_msg_len DESC
