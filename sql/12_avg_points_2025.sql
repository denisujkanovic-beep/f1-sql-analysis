-- Q6: Average points per race result by team, season 2025

SELECT
    t.name,
    ROUND(AVG(COALESCE(r.points, 0)), 2) AS avg_points
FROM teams t
JOIN results r ON r.team_id = t.team_id
JOIN races ra ON ra.race_id = r.race_id
WHERE ra.year = 2025
GROUP BY t.team_id, t.name
ORDER BY avg_points DESC;
-- McLaren 16.15 | Mercedes 8.83 | Red Bull 8.54 ... Alpine 0.42

-- NULL points mean 0 points (see K2). AVG skips NULLs, so COALESCE(points, 0)
-- is needed. Without it Alpine would show 4.00 instead of 0.42
-- and Red Bull would rank ahead of Mercedes.
-- Finding: McLaren scored almost twice as many points per result as Mercedes.
