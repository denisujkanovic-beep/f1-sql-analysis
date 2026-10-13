-- Q7: How many drivers won 1, 2, 3 ... races? (win histogram)

WITH driver_wins AS (
    SELECT
        driver_id,
        COUNT(*) AS wins
    FROM results
    WHERE position = 1
    GROUP BY driver_id
)
SELECT
    wins,
    COUNT(*) AS drivers_count
FROM driver_wins
GROUP BY wins
ORDER BY wins;
-- 116 race winners in total | 34 drivers won exactly 1 race
-- 17 drivers have 20 or more wins

-- Finding: winning repeatedly is rare. Almost a third of all race winners
-- (34 of 116) never won a second race.
