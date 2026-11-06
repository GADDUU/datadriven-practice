WITH CTE AS (
  SELECT
    repo_name,
    SUM(added) AS lines_added,
    COUNT(commit_id) AS commit_count,
    AVG(SUM(added)) OVER() AS avg_lines_added
  FROM repo_commits
  GROUP BY repo_name
)
  
SELECT
  repo_name,
  lines_added,
  commit_count
FROM CTE
WHERE lines_added > avg_lines_added
ORDER BY lines_added DESC
