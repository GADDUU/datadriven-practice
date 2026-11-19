WITH filtered_data AS (
  SELECT
    day,
    COUNT(edited) FILTER (
      WHERE edited = 'false'
    ) AS cnt_non_edited,
    COUNT(edited) FILTER (
      WHERE edited = 'true'
    ) AS cnt_edited
  FROM (
    SELECT
      TO_CHAR(sent_at, 'YYYY-MM-DD') AS day,
      edited
    FROM chat_msgs
  )
  GROUP BY day
  HAVING cnt_edited > cnt_non_edited
)

SELECT
  *
FROM chat_msgs
WHERE TO_CHAR(sent_at, 'YYYY-MM-DD') IN (
  SELECT
    day
  FROM filtered_data
)
