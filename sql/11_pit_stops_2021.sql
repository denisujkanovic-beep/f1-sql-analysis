-- Q5: Which team had the fastest pit stops in 2021?

SELECT
    t.name,
    ROUND(AVG(p.duration_ms) / 1000.0, 2) AS avg_pit_s
FROM pit_stops p
JOIN results r ON r.race_id   = p.race_id
              AND r.driver_id = p.driver_id
JOIN teams t ON t.team_id = r.team_id
JOIN races ra ON ra.race_id = p.race_id
WHERE ra.year = 2021
  AND p.duration_ms <= 60000
GROUP BY t.team_id, t.name
ORDER BY avg_pit_s;
-- Red Bull 23.98 s (fastest) ... Haas 26.12 s (slowest)

-- Joined on race_id AND driver_id: one pit stop belongs to exactly one result row.
-- Stops over 60 s excluded (red-flag interruptions, see K6).
-- Finding: Red Bull had the fastest pit lane times in 2021. Without excluding
-- outliers the averages were 159-250 s and the ranking was completely different.
