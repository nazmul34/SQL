# Practice database (Postgres in Docker)

Tables and data for running `query set 1.sql` .. `query set 4.sql`.

## Start / stop

```bash
cd db
docker compose up -d      # first start also creates + seeds the schema
docker compose down       # stop (data survives)
docker compose down -v    # stop and wipe data; next `up` re-seeds from init/
```

## Connect

| | |
|---|---|
| host / port | `localhost` / `5432` |
| database | `sqlpractice` |
| user / password | `sqluser` / `sqlpass` |
| URL | `postgresql://sqluser:sqlpass@localhost:5432/sqlpractice` |

Shell:

```bash
docker exec -it sql-practice-pg psql -U sqluser -d sqlpractice
```

Run the whole converted query file:

```bash
psql "postgresql://sqluser:sqlpass@localhost:5432/sqlpractice" -f db/query_sets_postgres.sql
```

## Tables

| Table | Rows | Used by |
|---|---|---|
| `country` | 18 | set 2 (#5, #6, #7) |
| `city` | 130 | set 1 (#1, #2, #3, #15–#18), set 2 (#5, #6, #7) |
| `station` | 42 | set 1 (#4–#14), set 3 (#1, #2) |
| `students` | 15 | set 2 (#1) |
| `employee` | 12 | set 2 (#2, #3), set 3 (#4) |
| `employees` | 10 | set 3 (#3) |
| `triangles` | 4 | set 2 (#4) |
| `occupations` | 16 | set 3 (#5), set 4 (#1) |
| `bst` | 7 | set 4 (#2) |

The data is deliberately shaped so no query returns an empty or degenerate result:
`station` has duplicate city names and names starting/ending in vowels, `employee`
has a three-way tie for maximum total earnings, `occupations` has uneven counts per
occupation so the set 4 pivot produces NULLs, and every `employees` salary contains a 0.

## Note on dialect

The `query set *.sql` files are MySQL (HackerRank). `query_sets_postgres.sql` is the
Postgres port — every difference is marked `-- [PG]`. The changes are:

- `REGEXP` / `NOT REGEXP` → `~*` / `!~*` (`~*` because MySQL's `REGEXP` is case-insensitive by default)
- `WHERE Continent = 'asia'` → `'Asia'` (Postgres `=` is case-sensitive)
- `REPLACE(Salary, '0', '')` → `REPLACE(Salary::text, '0', '')::numeric`
- the set 4 pivot's MySQL user variables (`@r1 := @r1 + 1`) → `ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name)`

Everything else runs unchanged.
