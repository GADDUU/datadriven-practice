SELECT
  sender_id,
  COUNT(msg_id) AS msg_count
FROM chat_msgs
WHERE EXTRACT(YEAR FROM sent_at) = 2026
  AND LENGTH(COALESCE(content, '')) <> 0
GROUP BY sender_id
HAVING COUNT(msg_id) > 2
