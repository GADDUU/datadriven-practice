SELECT
  COUNT(DISTINCT hostname) AS unique_hosts
FROM infra_nodes
WHERE LOWER(status) IN ('draining', 'offline')
