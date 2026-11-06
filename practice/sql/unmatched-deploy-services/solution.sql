SELECT DISTINCT d.svc_name
FROM deploy_logs d
WHERE NOT EXISTS (
    SELECT 1
    FROM ci_builds c
    WHERE c.repo_name = d.svc_name
)
ORDER BY d.svc_name ASC;
