SELECT DISTINCT
  a.user_id
FROM ad_impressions AS a
WHERE EXISTS (
  SELECT
    1
  FROM users AS u
  WHERE clicked <> 0
)
