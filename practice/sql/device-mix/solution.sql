SELECT
  device_type,
  os_name,
  COUNT(device_id) AS device_type
FROM devices
WHERE browser IS NOT NULL
GROUP BY device_type, os_name
HAVING COUNT(device_id) >= 3
