SELECT
  *
FROM ad_impressions AS i
LEFT JOIN users AS u
  ON i.user_id = u.user_id
WHERE ad_campaign = 'HOLIDAY_PROMO'
ORDER BY i.impression_id
