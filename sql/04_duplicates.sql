-- K4: Is any driver listed more than once in the same race?

SELECT
    race_id,
    driver_id,
    COUNT(*) AS rows_count
FROM results
GROUP BY race_id, driver_id
HAVING COUNT(*) > 1;
-- 89 pairs, almost all from the 1950s

-- Finding: not a data error. In early F1 drivers shared or switched cars
-- during a race, so one driver can have one row per car. Rows are kept.
