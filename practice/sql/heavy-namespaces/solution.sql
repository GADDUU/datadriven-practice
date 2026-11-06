SELECT
  nspace,
  COUNT(DISTINCT pod_id) AS failing_pods
FROM k8s_pods
WHERE status = 'Error' 
  OR status = 'CrashLoopBackOff'
GROUP BY nspace
HAVING COUNT(DISTINCT pod_id) > 12
