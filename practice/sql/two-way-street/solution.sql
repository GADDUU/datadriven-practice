SELECT
  COUNT(DISTINCT reply_to) AS conversation_count,
  COUNT(DISTINCT reply_to) AS replying_users
FROM chat_msgs
