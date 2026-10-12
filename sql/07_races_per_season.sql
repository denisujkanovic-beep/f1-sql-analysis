-- Q1: How many races were held in each season?

SELECT
    year,
    COUNT(*) AS num_races
FROM races
GROUP BY year
ORDER BY year;
-- 1950: 7 races | record: 24 races in 2024 and 2025

-- Finding: the number of races per season grew from 7 in 1950
-- to a record 24 in 2024 and 2025. Season 2026 is still in progress.
