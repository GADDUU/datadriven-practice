SELECT
  *
FROM ad_impressions
WHERE LOWER(ad_campaign) LIKE '%retarget%'
