SELECT
    ai.ad_campaign,
    LOWER(pn.platform) AS platform,
    COUNT(*) AS impression_count
FROM ad_impressions AS ai
JOIN (
    SELECT DISTINCT
        user_id,
        LOWER(platform) AS platform
    FROM push_notifs
    WHERE LOWER(campaign) LIKE '%loyalty%'
      AND user_id IS NOT NULL
) AS pn
    ON ai.user_id = pn.user_id
GROUP BY
    ai.ad_campaign,
    LOWER(pn.platform)
ORDER BY
    ai.ad_campaign,
    platform;
