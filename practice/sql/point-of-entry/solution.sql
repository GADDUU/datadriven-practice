WITH first_events AS (
  SELECT
    user_id,
    event_type,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY event_timestamp
    ) AS rn
  FROM event_data
),
page_view_users AS (
  SELECT
    user_id
  FROM first_events
  WHERE rn = 1
    AND event_type = 'page_view'
)

SELECT
  p.user_id,
  COUNT(e.event_type) AS purchase_count
FROM page_view_users AS p
LEFT JOIN event_data AS e
  ON p.user_id = e.user_id
  AND e.event_type = 'purchase'
GROUP BY p.user_id
ORDER BY purchase_count DESC, p.user_id ASC
