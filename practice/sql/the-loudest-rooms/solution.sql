SELECT
  c.channel,
  COUNT(a.impression_id) AS impression_count
FROM chat_msgs AS c
INNER JOIN ad_impressions AS a
  ON c.sender_id = a.user_id
GROUP BY c.channel
ORDER BY impression_count DESC
