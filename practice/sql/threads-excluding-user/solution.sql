SELECT
  COUNT(DISTINCT sender_id) FILTER(WHERE reply_to IS NOT NULL) AS conversation_count
FROM chat_msgs
