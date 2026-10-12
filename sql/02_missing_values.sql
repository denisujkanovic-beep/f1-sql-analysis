-- K2: Missing values in columns used by the analysis

SELECT
    COUNT(*)                                          AS total_results,
    SUM(CASE WHEN position IS NULL THEN 1 ELSE 0 END) AS missing_position,
    SUM(CASE WHEN grid     IS NULL THEN 1 ELSE 0 END) AS missing_grid,
    SUM(CASE WHEN points   IS NULL THEN 1 ELSE 0 END) AS missing_points
FROM results;
-- 27 665 results | 10 928 no position | 2 015 no grid | 19 083 no points

-- What does NULL in points mean?
SELECT COUNT(*) AS zero_points
FROM results
WHERE points = 0;
-- 0 rows -> no zeros exist, drivers without points have NULL

-- Finding: missing position = did not finish (see status).
-- NULL points = 0 points, so averages use COALESCE(points, 0).
