WITH gaps AS (
  SELECT
    repo_name,
    JULIANDAY(commit_at) - JULIANDAY(
      LAG(commit_at, 1) OVER (
        PARTITION BY repo_name
        ORDER BY commit_at, commit_id
      )
    ) AS gap_days
  FROM repo_commits
),
per_repo AS (
  SELECT
    repo_name,
    MAX(gap_days) AS longest_silence,
    COUNT(gap_days) AS gap_count
  FROM gaps
  WHERE gap_days IS NOT NULL
  GROUP BY repo_name
  HAVING COUNT(gap_days) > 31
)

SELECT
  repo_name,
  longest_silence,
  ROW_NUMBER() OVER (
    ORDER BY longest_silence DESC, repo_name
  ) AS silence_rank
FROM per_repo
ORDER BY silence_rank
