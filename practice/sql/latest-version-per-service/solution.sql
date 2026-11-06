WITH ranked_deploy AS (
  SELECT
    svc_name,
    version,
    deploy_at,
    dur_secs,
    ROW_NUMBER() OVER(PARTITION BY svc_name ORDER BY deploy_at DESC) AS rnk
  FROM deploy_logs
) 
  
SELECT
  svc_name,
  version,
  dur_secs
FROM ranked_deploy
WHERE rnk = 1
