SELECT
  *
FROM infra_nodes
WHERE region IN ('eu-west-1', 'eu-central-1')
  AND cpu_pct > 70
ORDER BY node_id
