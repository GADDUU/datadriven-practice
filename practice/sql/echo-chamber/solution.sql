SELECT
  a1.call_id AS call_id_1,
  a2.call_id AS call_id_2,
  a1.method AS method,
  a1.status AS status
FROM api_calls AS a1
INNER JOIN api_calls AS a2
  ON a1.call_id < a2.call_id
  AND a1.method = a2.method
  AND a1.status = a2.status
ORDER BY status DESC, call_id_1
LIMIT 20
