WITH marked_messages AS (
  SELECT
    topic,
    msg_id,
    offset,
    LAG(offset, 1) OVER (
      PARTITION BY topic
      ORDER BY offset, msg_id
    ) AS prev_offset,
    ROW_NUMBER() OVER (
      PARTITION BY topic
      ORDER BY offset, msg_id
    ) AS msg_position,
    CASE
      WHEN ROW_NUMBER() OVER (
        PARTITION BY topic
        ORDER BY offset, msg_id
      ) = 1 THEN 1
      WHEN offset <> LAG(offset, 1) OVER (
        PARTITION BY topic
        ORDER BY offset, msg_id
      ) THEN 1
      ELSE 0
    END AS is_new_offset
  FROM stream_msgs
),
running_stats AS (
  SELECT
    topic,
    offset,
    prev_offset,
    msg_position,
    SUM(is_new_offset) OVER (
      PARTITION BY topic
      ORDER BY offset, msg_id
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS distinct_offsets_so_far
  FROM marked_messages
)

SELECT
  topic,
  offset,
  prev_offset,
  distinct_offsets_so_far,
  msg_position,
  1.0 * distinct_offsets_so_far / msg_position AS new_offset_fraction
FROM running_stats
WHERE prev_offset IS NOT NULL
ORDER BY topic, offset, msg_position
