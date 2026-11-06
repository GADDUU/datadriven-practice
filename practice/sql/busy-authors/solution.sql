SELECT
    LOWER(TRIM(author)) AS author,
    COUNT(*) AS commit_count,
    COUNT(DISTINCT repo_name) AS repo_count
FROM repo_commits
WHERE message IS NOT NULL
GROUP BY LOWER(TRIM(author))
HAVING COUNT(message) >= 24;
