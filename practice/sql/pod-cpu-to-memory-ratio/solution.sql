SELECT
  nspace,
  AVG(mem_used) AS avg_mem_used
FROM k8s_pods
WHERE status = 'CrashLoopBackOff'
GROUP BY nspace
ORDER BY avg_mem_used DESC
