SELECT
    ai.ad_campaign,
    ROUND(
        100.0 * COUNT(u.user_id) / COUNT(*),
        1
    ) AS known_account_percentage
FROM ad_impressions ai
LEFT JOIN users u
    ON ai.user_id = u.user_id
GROUP BY ai.ad_campaign
ORDER BY known_account_percentage DESC;
