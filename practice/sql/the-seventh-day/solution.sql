WITH flagged AS (
  SELECT
    DATE_FORMAT(u.signup_date, '%Y-%m') AS cohort_month,
    EXISTS (
      SELECT
        1
      FROM page_views AS p
      WHERE p.user_id = u.user_id
        AND p.viewed_at >= u.signup_date + INTERVAL 7 DAY
    ) AS is_retained
  FROM users AS u
  WHERE u.account_status <> 'pending_verification'
)

SELECT
  cohort_month,
  COUNT(*) AS total_signups,
  SUM(is_retained) AS retained_users,
  ROUND(100.0 * SUM(is_retained) / COUNT(*), 1) AS retention_pct
FROM flagged
GROUP BY cohort_month
ORDER BY cohort_month
