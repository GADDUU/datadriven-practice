SELECT 
    migr_id,
    version,
    status,
    applied,
    rollback,
    dur_ms,
    author,
    db_name
FROM migrations
WHERE version = (
    SELECT version 
    FROM migrations 
    ORDER BY migr_id DESC 
    LIMIT 1
);
