SELECT
    n.hostname,
    n.cpu_pct,
    CASE
        WHEN n.cpu_pct >= 50 THEN 'busy'
        ELSE 'idle'
    END AS cpu_status,
    u.active_users
FROM infra_nodes AS n
CROSS JOIN (
    SELECT COUNT(*) AS active_users
    FROM users
    WHERE account_status = 'active'
) AS u
WHERE n.region = 'us-east-1';
