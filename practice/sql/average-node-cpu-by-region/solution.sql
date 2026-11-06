SELECT
  i.region,
  AVG(i.cpu_pct) AS avg_cpu
FROM infra_nodes AS i
INNER JOIN pod_assignments AS p
  ON i.node_id = p.node_id
WHERE p.svc_name IN ('payment-api', 'gateway', 'auth-svc')
GROUP BY i.region
