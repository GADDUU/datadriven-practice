SELECT
  built_at,
  dur_secs AS min_duration
FROM ci_builds
WHERE dur_secs = (
  SELECT
    MIN(dur_secs) 
  FROM ci_builds
)
ORDER BY built_at
LIMIT 1
