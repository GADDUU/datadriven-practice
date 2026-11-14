WITH filtered_channel AS (
  SELECT DISTINCT
    sender_id,
    channel
  FROM chat_msgs
  WHERE channel IN ('#engineering', '#data-team')
)
  
SELECT
  sender_id
FROM filtered_channel
GROUP BY sender_id
HAVING COUNT(channel) = 2
