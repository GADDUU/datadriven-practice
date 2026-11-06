WITH model_scores AS (
    SELECT DISTINCT
        mdl_name,
        accuracy
    FROM ml_models
    WHERE accuracy IS NOT NULL
),
ranked_models AS (
    SELECT
        mdl_name,
        accuracy,
        MAX(accuracy) OVER () AS highest,
        MIN(accuracy) OVER () AS lowest
    FROM model_scores
)
SELECT
    mdl_name,
    accuracy
FROM ranked_models
WHERE accuracy = highest
   OR accuracy = lowest
ORDER BY
    accuracy DESC,
    mdl_name ASC;
