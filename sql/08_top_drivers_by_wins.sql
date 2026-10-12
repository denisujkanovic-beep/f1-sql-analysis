-- Q2: Top 5 drivers by number of race wins

SELECT
    d.last_name,
    COUNT(*) AS wins
FROM drivers d
JOIN results r ON r.driver_id = d.driver_id
WHERE r.position = 1
GROUP BY d.driver_id, d.last_name
ORDER BY wins DESC
LIMIT 5;
-- Hamilton 106 | Schumacher 91 | Verstappen 73 | Vettel 53 | Prost 51

-- Finding: Hamilton leads with 106 wins. Three of the top five raced in the
-- last 20 years, when seasons have more races (see Q1).
-- Grouped by driver_id because last names repeat (e.g. Michael and Ralf Schumacher).
