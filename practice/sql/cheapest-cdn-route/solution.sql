SELECT
  MAX(bytes) AS largest_payload
FROM cdn_logs
WHERE edge_loc = 'SFO'
  AND status = 200
