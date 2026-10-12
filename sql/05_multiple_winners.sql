-- K5: Races with more than one winner

SELECT
    ra.year,
    ra.grand_prix,
    COUNT(*) AS winners
FROM results r
JOIN races ra ON ra.race_id = r.race_id
WHERE r.position = 1
GROUP BY r.race_id, ra.year, ra.grand_prix
HAVING COUNT(*) > 1;
-- 1951 France | 1956 Argentina | 1957 Great Britain (2 winners each)

-- Finding: shared cars in the 1950s, both drivers are credited with the win.
-- That is why there are more winners (1 169) than races (1 166).
