# Formula 1 Data Analysis (1950–2026) in SQL

SQL analysis of 75 years of Formula 1 results: data quality checks first,
then questions about wins, pole positions, pit stops and points.

## Context

This is a portfolio project. The brief is fictional: a sports news website is
preparing a series on Formula 1 history and asks a data analyst for numbers.
The data itself is real ([F1DB](https://github.com/f1db/f1db), 1950 to the 2026
Singapore Grand Prix).

## Key findings

- **Pole position helps, but does not decide the race.** About 44 % of races
  were won from pole position (509 of 1 169 wins).
- **Cleaning the data changed the answer.** In 2021 Red Bull had the fastest
  pit lane times (23.98 s on average). Without removing red-flag
  interruptions, averages were 159–250 s and the ranking was completely different.
- **Repeated winning is rare.** 116 drivers have won a race, but 34 of them
  won only once. Only 17 drivers have 20 or more wins.
- **Lewis Hamilton has the most wins (106)**, ahead of Michael Schumacher (91).
  Ferrari is the most successful team (251 wins).
- **Missing points mean zero.** Using a plain average would make weaker teams
  look up to 10x better (Alpine 2025: 4.00 instead of 0.42 points per result).

## Data quality checks

Before the analysis I checked the columns the questions rely on.

| # | Check | Result | Decision |
|---|---|---|---|
| K1 | [Data overview](sql/01_data_overview.sql) | 27 665 results, 1 166 races, 860 drivers, 186 teams | – |
| K2 | [Missing values](sql/02_missing_values.sql) | 40 % of results have no finishing position, 69 % have no points | NULL points mean 0 (no zeros exist in the data), averages use `COALESCE(points, 0)` |
| K3 | [Status values](sql/03_status_values.sql) | 206 values, written consistently (checked with `LOWER` and `TRIM`) | Some categories overlap in meaning (e.g. Accident, Collision) |
| K4 | [Duplicates](sql/04_duplicates.sql) | 89 race + driver pairs appear twice | Shared cars in the 1950s, rows kept |
| K5 | [Multiple winners](sql/05_multiple_winners.sql) | 3 races have two winners | Shared cars in the 1950s, rows kept |
| K6 | [Pit stop outliers](sql/06_pit_stop_outliers.sql) | 748 stops (about 3 %) longer than 60 s | Red-flag interruptions, excluded from pit stop analysis |

## Analysis

| # | Question | Finding |
|---|---|---|
| 1 | [Races per season](sql/07_races_per_season.sql) | From 7 races in 1950 to a record 24 in 2024 and 2025 |
| 2 | [Top 5 drivers by wins](sql/08_top_drivers_by_wins.sql) | Hamilton 106, Schumacher 91, Verstappen 73 |
| 3 | [Top 5 teams by wins](sql/09_top_teams_by_wins.sql) | Ferrari 251, McLaren 205, Mercedes 142 |
| 4 | [Wins from pole position](sql/10_pole_position_wins.sql) | About 44 % of races were won from pole |
| 5 | [Fastest pit stops in 2021](sql/11_pit_stops_2021.sql) | Red Bull 23.98 s, Haas 26.12 s (after cleaning) |
| 6 | [Average points per result in 2025](sql/12_avg_points_2025.sql) | McLaren 16.15, almost twice Mercedes (8.83) |
| 7 | [Win histogram](sql/13_win_histogram.sql) | 34 of 116 race winners won only once |

### Example: top 5 drivers by wins

| Driver | Wins |
|---|---|
| Hamilton | 106 |
| Schumacher | 91 |
| Verstappen | 73 |
| Vettel | 53 |
| Prost | 51 |

## Limitations

- `points` include race points only. Sprint points (since 2021) are not part
  of the `results` table.
- Seasons with shared cars (1950s) have more than one result per driver and
  race, and some races have two winners.
- Teams that changed their name are separate teams in the data
  (e.g. two different teams called "Lotus"), so results are grouped by `team_id`.
- Season 2026 is still in progress.

## Skills used

`JOIN` (including a join on two columns), `GROUP BY` and `HAVING`,
conditional aggregation with `CASE WHEN`, handling `NULL` with `COALESCE`,
CTEs (`WITH`), data quality checks (missing values, duplicates, outliers,
consistent text values).

## How to run

The queries are written in standard SQL and tested in SQLite.

```bash
sqlite3 f1.db < data/f1.sql
sqlite3 f1.db < sql/08_top_drivers_by_wins.sql
```

Or open `data/f1.sql` in [DB Browser for SQLite](https://sqlitebrowser.org/)
(File → Import → Database from SQL file) and run the queries there.

## Data

See [data/README.md](data/README.md). Source: [F1DB](https://github.com/f1db/f1db),
licensed under CC BY 4.0.

## Next steps

- Part 2: championship standings, qualifying gaps and window functions
- Python (pandas) version of the analysis with charts
