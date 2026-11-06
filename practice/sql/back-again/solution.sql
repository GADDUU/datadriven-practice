WITH user_counts AS (
    SELECT
        user_id,
        COUNT(*) AS txn_count
    FROM transactions
    WHERE total_amount > 0
    GROUP BY user_id
),
ranked_users AS (
    SELECT
        user_id,
        txn_count,
        DENSE_RANK() OVER (
            ORDER BY txn_count DESC
        ) AS tier
    FROM user_counts
)
SELECT
    u.username,
    r.txn_count,
    r.tier
FROM ranked_users AS r
JOIN users AS u
    ON r.user_id = u.user_id
WHERE r.tier <= 2
ORDER BY r.tier, u.username;
