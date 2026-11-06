SELECT
  *
FROM ad_impressions
WHERE ad_campaign IN ('RETARGETING_CART', 'BRAND_AWARENESS_Q1')
  AND revenue IS NOT NULL
