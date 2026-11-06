SELECT
  100.0 * SUM(
    CASE
      WHEN u.account_status = 'active'
        AND p.opened = 1 THEN 1
      ELSE 0
    END
  ) / COUNT(*) AS percentage
FROM users AS u
LEFT JOIN push_notifs AS p
  ON u.user_id = p.user_id
