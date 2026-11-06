SELECT
  channel,
  COUNT(msg_id) AS total_messages,
  COUNT(DISTINCT sender_id) AS unique_senders,
  ROUND(
    SUM(edited) * 100/ COUNT(msg_id),
    2
  ) AS edited_pct
FROM chat_msgs
GROUP BY channel
HAVING COUNT(reply_to) > 0
ORDER BY total_messages DESC, channel
