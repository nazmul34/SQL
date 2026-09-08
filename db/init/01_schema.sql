-- Schema for the HackerRank-style tables used by "query set 1.sql" .. "query set 4.sql"
-- Postgres folds unquoted identifiers to lowercase, so CITY / City / city all resolve here.

DROP TABLE IF EXISTS city, country, station, students, employee, employees, triangles, occupations, bst CASCADE;

-- query set 1 (#1,2,3,15,16,17,18) and query set 2 (#5,6,7)
CREATE TABLE country (
    code            CHAR(3)      PRIMARY KEY,
    name            VARCHAR(52)  NOT NULL,
    continent       VARCHAR(50)  NOT NULL,
    region          VARCHAR(26)  NOT NULL,
    surfacearea     NUMERIC(10,2),
    population      INTEGER,
    lifeexpectancy  NUMERIC(3,1),
    gnp             NUMERIC(10,2),
    governmentform  VARCHAR(45),
    capital         INTEGER,
    code2           CHAR(2)
);

CREATE TABLE city (
    id          INTEGER      PRIMARY KEY,
    name        VARCHAR(17)  NOT NULL,
    countrycode CHAR(3)      NOT NULL REFERENCES country(code),
    district    VARCHAR(20)  NOT NULL,
    population  INTEGER      NOT NULL
);

-- query set 1 (#4..#14) and query set 3 (#1,2)
CREATE TABLE station (
    id      INTEGER      PRIMARY KEY,
    city    VARCHAR(21)  NOT NULL,
    state   VARCHAR(2)   NOT NULL,
    lat_n   NUMERIC(10,4) NOT NULL,
    long_w  NUMERIC(10,4) NOT NULL
);

-- query set 2 (#1)
CREATE TABLE students (
    id    INTEGER      PRIMARY KEY,
    name  VARCHAR(30)  NOT NULL,
    marks INTEGER      NOT NULL
);

-- query set 2 (#2,3) and query set 3 (#4)
CREATE TABLE employee (
    employee_id INTEGER     PRIMARY KEY,
    name        VARCHAR(30) NOT NULL,
    months      INTEGER     NOT NULL,
    salary      INTEGER     NOT NULL
);

-- query set 3 (#3) -- separate table from EMPLOYEE, as on HackerRank
CREATE TABLE employees (
    id     INTEGER PRIMARY KEY,
    salary INTEGER NOT NULL
);

-- query set 2 (#4)
CREATE TABLE triangles (
    a INTEGER NOT NULL,
    b INTEGER NOT NULL,
    c INTEGER NOT NULL
);

-- query set 3 (#5) and query set 4 (#1)
CREATE TABLE occupations (
    name       VARCHAR(30) NOT NULL,
    occupation VARCHAR(30) NOT NULL
);

-- query set 4 (#2)
CREATE TABLE bst (
    n INTEGER PRIMARY KEY,
    p INTEGER
);
