SELECT
  AVG(latency) AS mean_latency,
  VAR_SAMP(latency) AS sample_variance, -- Sample Variance & Standard Deviation (N - 1)
  STDDEV_SAMP(latency) AS sample_stddev,
  VAR_POP(latency) AS pop_variance, -- Population Variance & Standard Deviation (N)
  STDDEV_POP(latency) AS pop_stddev
FROM api_calls
WHERE status = 200
