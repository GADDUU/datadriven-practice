WITH filtered_impressions AS (
  SELECT DISTINCT
    ad_campaign
  FROM ad_impressions
  WHERE LOWER(ad_campaign) LIKE '%flash%'
    OR LOWER(ad_campaign) LIKE '%loyalty%'
    OR LOWER(ad_campaign) LIKE '%summer%'
),
filtered_notifs AS (
  SELECT DISTINCT
    campaign
  FROM push_notifs
  WHERE LOWER(campaign) LIKE '%flash%'
    OR LOWER(campaign) LIKE '%loyalty%'
    OR LOWER(campaign) LIKE '%summer%'
)
  
SELECT
  fi.ad_campaign,
  fn.campaign
FROM filtered_impressions AS fi
CROSS JOIN filtered_notifs AS fn
WHERE LOWER(ad_campaign) LIKE '%flash%' AND LOWER(campaign) LIKE '%flash%'
  OR LOWER(ad_campaign) LIKE '%loyalty%' AND LOWER(campaign) LIKE '%loyalty%'
  OR LOWER(ad_campaign) LIKE '%summer%' AND LOWER(campaign) LIKE '%summer%'
