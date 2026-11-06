WITH valid_commits AS (
  SELECT
    author,
    TRIM(message) AS message,
    LENGTH(TRIM(message)) AS message_length,
    AVG(LENGTH(TRIM(message))) OVER() AS avg_msg_length
  FROM repo_commits
  WHERE message IS NOT NULL
    AND LENGTH(TRIM(message)) > 0
)

SELECT 
    author,
    message,
    message_length
FROM valid_commits
WHERE message_length> avg_msg_length
ORDER BY message_length DESC;
