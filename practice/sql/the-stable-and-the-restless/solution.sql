SELECT
  status,
  SUM(
    CASE
      WHEN restarts = 0 THEN 1
      ELSE 0
    END) AS pod_count
FROM k8s_pods
GROUP BY status
ORDER BY pod_count DESC, status ASC
