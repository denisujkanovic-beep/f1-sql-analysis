# Data

`f1.sql` contains 8 tables extracted from **F1DB**, an open Formula 1 database.

- Source: https://github.com/f1db/f1db (SQLite release)
- License: CC BY 4.0 (attribution: F1DB)
- Coverage: seasons 1950–2026, up to the 2026 Singapore Grand Prix (11 Oct 2026)
- Created with `build_f1.py`

Load into SQLite:

    sqlite3 f1.db < f1.sql
