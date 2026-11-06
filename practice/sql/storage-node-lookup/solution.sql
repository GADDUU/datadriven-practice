SELECT
  hostname,
  cpu_pct
FROM infra_nodes
WHERE LOWER(node_type) = 'storage'
