-- Q4: Does starting from pole position help to win?

SELECT
    SUM(CASE WHEN grid = 1 THEN 1 ELSE 0 END) AS wins_from_pole,
    SUM(CASE WHEN grid = 1 THEN 0 ELSE 1 END) AS wins_from_other
FROM results
WHERE position = 1;
-- 509 wins from pole | 660 wins from other positions

-- Note: 3 winners have no grid position (NULL). grid <> 1 would skip them,
-- so ELSE 1 is used to count them as "other".

-- Finding: about 44 % of races were won from pole position.
-- Pole position helps, but most races were won from other positions.
