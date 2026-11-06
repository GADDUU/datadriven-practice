WITH classified AS (
    SELECT
        latency,
        CASE
            WHEN uptime >= 99.9 THEN 'Platinum'
            WHEN uptime >= 99.0 THEN 'Gold'
            WHEN uptime >= 95.0 THEN 'Silver'
            ELSE 'Bronze'
        END AS tier
    FROM svc_health
    WHERE LOWER(status) <> 'degraded'
       OR status IS NULL
)
SELECT
    tier,
    MIN(latency) AS min_latency,
    AVG(latency) AS avg_latency,
    MAX(latency) AS max_latency
FROM classified
GROUP BY tier
ORDER BY avg_latency DESC;
