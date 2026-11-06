WITH user_purchases AS (
    SELECT 
        user_id,
        SUM(total_amount) AS total_spent
    FROM transactions
    GROUP BY user_id
),
user_ad_revenue AS (
    SELECT 
        user_id,
        SUM(revenue) AS total_ad_revenue
    FROM ad_impressions
    WHERE user_id IS NOT NULL
    GROUP BY user_id
),
user_combined_values AS (
    SELECT 
        u.account_status,
        u.user_id,
        COALESCE(p.total_spent, 0) + COALESCE(a.total_ad_revenue, 0) AS total_user_value
    FROM users u
    LEFT JOIN user_purchases p 
        ON u.user_id = p.user_id
    LEFT JOIN user_ad_revenue a 
        ON u.user_id = a.user_id
)
SELECT 
    account_status,
    ROUND(AVG(total_user_value), 3) AS avg_total_value
FROM user_combined_values
GROUP BY account_status
ORDER BY account_status;
