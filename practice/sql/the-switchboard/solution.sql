WITH ranked_flags AS (
    SELECT
        flag_name,
        enabled,
        ROW_NUMBER() OVER (
            PARTITION BY flag_name 
            ORDER BY updated DESC, flag_id DESC
        ) AS rn
    FROM feat_flags
)
SELECT
    flag_name,
    CASE WHEN enabled = 1 THEN 1 ELSE 0 END AS is_enabled,
    CASE WHEN enabled = 0 THEN 1 ELSE 0 END AS is_disabled
FROM ranked_flags
WHERE rn = 1
ORDER BY flag_name ASC;
