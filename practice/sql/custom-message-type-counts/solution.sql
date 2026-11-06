SELECT
  reply_to AS recipient_id,
  msg_type,
  COUNT(msg_id) AS msg_count
FROM chat_msgs
WHERE reply_to IS NOT NULL
  AND msg_type NOT IN ('text', 'image')
GROUP BY reply_to, msg_type
