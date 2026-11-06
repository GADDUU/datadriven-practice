WITH ranked_migrations AS (
  SELECT
    migr_id,
    version,
    status,
    applied,
    rollback,
    dur_ms,
    author,
    db_name,
    ROW_NUMBER() OVER (
      PARTITION BY db_name
      ORDER BY migr_id
    ) AS rn
  FROM migrations
)

SELECT
  migr_id,
  version,
  status,
  applied,
  rollback,
  dur_ms,
  author,
  db_name
FROM ranked_migrations
WHERE rn = 1
ORDER BY db_name
