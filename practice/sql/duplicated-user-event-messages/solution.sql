WITH base_data AS (
SELECT
  msg_id,
  LOWER(topic) AS topic,
  part_key,
  payload,
  produced,
  consumer
FROM stream_msgs
WHERE LOWER(topic) = 'user-events'
  AND consumer IS NOT NULL
)

SELECT
  *
FROM base_data

UNION ALL
  
SELECT
  *
FROM base_data
ORDER BY msg_id
