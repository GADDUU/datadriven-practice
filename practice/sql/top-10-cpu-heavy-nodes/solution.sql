SELECT DISTINCT
  node_id,
  hostname,
  cpu_pct
FROM infra_nodes
ORDER BY cpu_pct DESC
LIMIT 10
