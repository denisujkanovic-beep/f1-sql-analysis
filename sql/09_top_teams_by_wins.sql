-- Q3: Top 5 teams by number of race wins

SELECT
    t.name,
    COUNT(*) AS wins
FROM teams t
JOIN results r ON r.team_id = t.team_id
WHERE r.position = 1
GROUP BY t.team_id, t.name
ORDER BY wins DESC
LIMIT 5;
-- Ferrari 251 | McLaren 205 | Mercedes 142 | Red Bull 132 | Williams 114

-- Finding: Ferrari has the most wins (251), ahead of McLaren (205).
-- Grouped by team_id because names repeat: two different teams are called "Lotus".
