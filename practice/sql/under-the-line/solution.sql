WITH service_spend AS (
  SELECT
    LOWER(team_name) AS team_name,
    svc_name,
    SUM(amount) AS svc_spend
  FROM cost_allocs
  GROUP BY LOWER(team_name), svc_name
),
team_spend AS (
  SELECT
    team_name,
    SUM(svc_spend) AS total_spend,
    AVG(svc_spend) AS avg_svc_spend
  FROM service_spend
  GROUP BY team_name
),
overall_avg AS (
  SELECT
    AVG(total_spend) AS avg_team_spend
  FROM team_spend
)

SELECT
  ts.team_name,
  ts.total_spend,
  ts.avg_svc_spend
FROM team_spend AS ts
CROSS JOIN overall_avg AS oa
WHERE ts.total_spend < 2 * oa.avg_team_spend
ORDER BY ts.team_name
