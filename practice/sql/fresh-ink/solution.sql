SELECT
  repo_name,
  COUNT(*) AS commit_count
FROM repo_commits
WHERE commit_at >= (
    SELECT
      DATE_TRUNC('month', MAX(commit_at)) - INTERVAL '24 months'
    FROM repo_commits
  )
  AND commit_at < (
    SELECT
      DATE_TRUNC('month', MAX(commit_at)) + INTERVAL '1 month'
    FROM repo_commits
  )
GROUP BY repo_name
ORDER BY commit_count DESC
LIMIT 3
