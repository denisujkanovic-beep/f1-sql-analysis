-- K3: Distinct values in the status column

SELECT
    status,
    COUNT(*) AS results_count
FROM results
GROUP BY status
ORDER BY results_count DESC;
-- 206 distinct values | Finished 15 863 | Engine 2 023 | DNQ 1 029
-- | Accident 930 | Collision 924 | Gearbox 843

-- Are values written consistently (case, extra spaces)?
SELECT
    COUNT(DISTINCT status)              AS distinct_status,
    COUNT(DISTINCT LOWER(TRIM(status))) AS distinct_status_clean
FROM results;
-- 206 | 206 -> no duplicates caused by case or spaces

-- Finding: status values are written consistently. About 57 % of results
-- finished the race; the most common reason for not finishing is engine failure.
-- Some categories overlap in meaning (e.g. Accident, Collision), so they
-- would need grouping for an analysis of crashes.
