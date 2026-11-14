WITH successful_builds AS (
  SELECT
    repo_name,
    COUNT(*) AS successful_build_count
  FROM ci_builds
  WHERE status = 'success'
  GROUP BY repo_name
),
major_commits AS (
  SELECT
    repo_name,
    COUNT(*) AS major_commit_count
  FROM repo_commits
  WHERE added > 350
  GROUP BY repo_name
)

SELECT
  b.repo_name,
  b.successful_build_count
FROM successful_builds AS b
LEFT JOIN major_commits AS m
  ON b.repo_name = m.repo_name
WHERE b.successful_build_count >= COALESCE(m.major_commit_count, 0)
ORDER BY b.successful_build_count DESC
