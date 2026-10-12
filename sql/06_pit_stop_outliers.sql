-- K6: Pit stops longer than 60 seconds (normal stop takes 20-30 s)

SELECT
    ra.year,
    COUNT(*) AS stops_over_60s
FROM pit_stops pt
JOIN races ra ON ra.race_id = pt.race_id
WHERE pt.duration_ms > 60000
GROUP BY ra.year
ORDER BY ra.year;
-- 748 of 22 632 stops (~3 %), most in 2021 (110), 2023 (104), 2016 (77)

-- Finding: these are not real pit stops but red-flag interruptions,
-- when cars wait in the pit lane (up to over an hour).
-- They distort averages, so pit stop analysis excludes stops over 60 s.
