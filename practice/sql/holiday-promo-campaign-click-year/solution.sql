SELECT
  click_month
FROM (
  SELECT
    TO_CHAR(impression_time, 'YYYY-MM') AS click_month,
    SUM(clicked) AS click
  FROM ad_impressions
  WHERE ad_campaign = 'HOLIDAY_PROMO'
  GROUP BY click_month
  HAVING SUM(clicked) > 0
)
