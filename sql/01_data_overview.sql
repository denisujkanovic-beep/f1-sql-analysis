-- K1: Data overview
-- Question: How much data do we have?
-- Table: results

SELECT
    COUNT(*)                  AS total_results,
    COUNT(DISTINCT race_id)   AS unique_races,
    COUNT(DISTINCT driver_id) AS unique_drivers,
    COUNT(DISTINCT team_id)   AS unique_teams
FROM results;

-- Result: 27 665 results | 1 166 races | 860 drivers | 186 teams
-- Finding: The dataset covers 1 166 races (1950–2026) with 860 drivers and 186 teams.
