SELECT
    author,
    COUNT(DISTINCT LOWER(env_name)) AS environment_count
FROM deploy_logs
WHERE LOWER(env_name) IN ('dev', 'production')
GROUP BY author
HAVING COUNT(DISTINCT LOWER(env_name)) = 2
ORDER BY author ASC;
