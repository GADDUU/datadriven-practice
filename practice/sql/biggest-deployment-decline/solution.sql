WITH deploy_2025 AS (
  SELECT
    svc_name,
    COUNT(*) AS deploy_cnt
  FROM deploy_logs
  WHERE svc_name IN (
      SELECT
        svc_name
      FROM svc_health
    )
    AND EXTRACT(YEAR FROM deploy_at) = 2025
  GROUP BY svc_name
),
deploy_2026 AS (
  SELECT
    svc_name,
    COUNT(*) AS deploy_cnt
  FROM deploy_logs
  WHERE svc_name IN (
      SELECT
        svc_name
      FROM svc_health
    )
    AND EXTRACT(YEAR FROM deploy_at) = 2026
  GROUP BY svc_name
)

SELECT
  svc_name,
  deploy_growth
FROM (
  SELECT
    d6.svc_name,
    d6.deploy_cnt - d5.deploy_cnt AS deploy_growth
  FROM deploy_2026 AS d6
  INNER JOIN deploy_2025 AS d5
    ON d6.svc_name = d5.svc_name
)
ORDER BY deploy_growth DESC
LIMIT 1
