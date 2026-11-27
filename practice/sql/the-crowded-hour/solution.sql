WITH device_sessions AS (
  SELECT
    d.device_type,
    us.user_id,
    us.session_start
  FROM user_sessions AS us
  JOIN devices AS d
    ON us.device_id = d.device_id
  WHERE d.device_type IS NOT NULL
),
window_counts AS (
  SELECT
    ds1.device_type,
    ds1.session_start AS window_start,
    ds1.session_start + INTERVAL '45 days' AS window_end,
    COUNT(DISTINCT ds2.user_id) AS peak_active_users
  FROM device_sessions AS ds1
  JOIN device_sessions AS ds2
    ON ds1.device_type = ds2.device_type
      AND ds2.session_start >= ds1.session_start
      AND ds2.session_start < ds1.session_start + INTERVAL '45 days'
  GROUP BY ds1.device_type, ds1.session_start
),
ranked AS (
  SELECT
    device_type,
    window_start,
    window_end,
    peak_active_users,
    ROW_NUMBER() OVER (
      PARTITION BY device_type
      ORDER BY peak_active_users DESC, window_start
    ) AS rn
  FROM window_counts
)

SELECT
  device_type,
  CAST(window_start AS DATE) || ' to ' || CAST(window_end AS DATE) AS window_span,
  peak_active_users
FROM ranked
WHERE rn = 1
ORDER BY peak_active_users DESC, device_type
LIMIT 3
