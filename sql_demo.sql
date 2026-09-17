-- ==========================================================
-- This SQL script shows many SQL tricks, step by step.
-- Every part has a simple comment so even a child can understand it!
-- Works with SQLite (also works with MySQL/PostgreSQL with tiny changes)
-- ==========================================================

-- ----------------------------------------------------------
-- STEP 1: Create a table (like making an empty Excel sheet with column names)
-- ----------------------------------------------------------
DROP TABLE IF EXISTS people;   -- remove old table first, so we can start fresh

CREATE TABLE people (
    id INTEGER PRIMARY KEY,     -- a unique number for each person
    name TEXT,                  -- person's name
    city TEXT,                  -- which city they live in
    age INTEGER,                -- how old they are
    mobile TEXT                 -- their phone number
);

-- ----------------------------------------------------------
-- STEP 2: Insert data (fill the table with rows, like typing into Excel)
-- ----------------------------------------------------------
INSERT INTO people (id, name, city, age, mobile) VALUES
(1, 'Rohit Sharma', 'Delhi', 28, '9876543210'),
(2, 'Priya Verma', 'Mumbai', 24, '9123456780'),
(3, 'Aman Gupta', 'Jaipur', 31, '9988776655'),
(4, 'Sneha Singh', 'Lucknow', 26, '9871234560'),
(5, 'Vikas Yadav', 'Pune', 29, '9765432180');

-- ----------------------------------------------------------
-- STEP 3: Select everything (look at the whole table)
-- ----------------------------------------------------------
SELECT * FROM people;                     -- * means "show me all columns"

-- ----------------------------------------------------------
-- STEP 4: Select specific columns only
-- ----------------------------------------------------------
SELECT name, city FROM people;            -- only show name and city columns

-- ----------------------------------------------------------
-- STEP 5: Filtering (WHERE = only show rows that match a rule)
-- ----------------------------------------------------------
SELECT * FROM people WHERE age > 26;                       -- people older than 26
SELECT * FROM people WHERE city = 'Delhi';                 -- people who live in Delhi
SELECT * FROM people WHERE city IN ('Delhi', 'Pune');       -- people in Delhi OR Pune
SELECT * FROM people WHERE age BETWEEN 25 AND 30;           -- age between 25 and 30

-- ----------------------------------------------------------
-- STEP 6: Sorting (put rows in order)
-- ----------------------------------------------------------
SELECT * FROM people ORDER BY age ASC;      -- youngest to oldest (ASC = ascending)
SELECT * FROM people ORDER BY age DESC;     -- oldest to youngest (DESC = descending)

-- ----------------------------------------------------------
-- STEP 7: Limiting results (show only a few rows)
-- ----------------------------------------------------------
SELECT * FROM people LIMIT 3;               -- only show the first 3 rows

-- ----------------------------------------------------------
-- STEP 8: Renaming columns in the output (just for display, doesn't change the table)
-- ----------------------------------------------------------
SELECT name AS full_name, city AS location FROM people;

-- ----------------------------------------------------------
-- STEP 9: Adding new calculated columns (math on the fly)
-- ----------------------------------------------------------
SELECT name, age, age + 5 AS age_after_5_years FROM people;

-- ----------------------------------------------------------
-- STEP 10: Updating data (changing an existing value)
-- ----------------------------------------------------------
UPDATE people SET age = 30 WHERE name = 'Vikas Yadav';   -- change Vikas's age to 30
SELECT * FROM people WHERE name = 'Vikas Yadav';          -- check the change

-- ----------------------------------------------------------
-- STEP 11: Deleting data (removing a row)
-- ----------------------------------------------------------
-- (We won't actually delete here so our data stays complete for later steps,
--  but this is how you would do it:)
-- DELETE FROM people WHERE id = 5;

-- ----------------------------------------------------------
-- STEP 12: Aggregate functions (simple math facts about the whole table)
-- ----------------------------------------------------------
SELECT COUNT(*) AS total_people FROM people;        -- how many rows (people) total
SELECT SUM(age) AS total_age FROM people;            -- add up all ages
SELECT AVG(age) AS average_age FROM people;          -- average age
SELECT MIN(age) AS youngest FROM people;             -- smallest age
SELECT MAX(age) AS oldest FROM people;                -- biggest age

-- ----------------------------------------------------------
-- STEP 13: Group By (group similar rows and find facts about each group)
-- ----------------------------------------------------------
-- First we add a "region" idea using CASE (like an if-else rule)
SELECT
    name,
    city,
    CASE
        WHEN city IN ('Delhi', 'Jaipur', 'Lucknow') THEN 'North'
        ELSE 'West'
    END AS region
FROM people;

-- Now group by that region and find average age per region
SELECT
    CASE
        WHEN city IN ('Delhi', 'Jaipur', 'Lucknow') THEN 'North'
        ELSE 'West'
    END AS region,
    AVG(age) AS avg_age,
    COUNT(*) AS people_count
FROM people
GROUP BY region;

-- ----------------------------------------------------------
-- STEP 14: Having (filter groups, not rows — used after GROUP BY)
-- ----------------------------------------------------------
SELECT city, COUNT(*) AS how_many
FROM people
GROUP BY city
HAVING COUNT(*) >= 1;          -- only show cities with at least 1 person

-- ----------------------------------------------------------
-- STEP 15: Joining tables (combine two tables using a common column)
-- ----------------------------------------------------------
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
    person_id INTEGER,
    salary INTEGER
);

INSERT INTO salaries (person_id, salary) VALUES
(1, 50000),
(2, 60000),
(3, 45000),
(4, 55000),
(5, 70000);

-- INNER JOIN: match rows from both tables using id = person_id
SELECT people.name, people.city, salaries.salary
FROM people
INNER JOIN salaries ON people.id = salaries.person_id;

-- LEFT JOIN: keep all people, even if they have no matching salary row
SELECT people.name, salaries.salary
FROM people
LEFT JOIN salaries ON people.id = salaries.person_id;

-- ----------------------------------------------------------
-- STEP 16: String operations (working with text)
-- ----------------------------------------------------------
SELECT UPPER(name) AS name_upper FROM people;         -- make names CAPITAL
SELECT LOWER(city) AS city_lower FROM people;          -- make city lowercase
SELECT LENGTH(name) AS name_length FROM people;        -- count letters in name
SELECT SUBSTR(name, 1, 3) AS first_three_letters FROM people;  -- first 3 letters of name

-- ----------------------------------------------------------
-- STEP 17: DISTINCT (remove duplicate values)
-- ----------------------------------------------------------
SELECT DISTINCT city FROM people;    -- list each city only once (no repeats)

-- ----------------------------------------------------------
-- STEP 18: Subqueries (a query inside another query)
-- ----------------------------------------------------------
-- Find people whose age is above the average age of everyone
SELECT name, age
FROM people
WHERE age > (SELECT AVG(age) FROM people);

-- ----------------------------------------------------------
-- STEP 19: Creating a View (a saved query you can reuse like a virtual table)
-- ----------------------------------------------------------
DROP VIEW IF EXISTS young_people;
CREATE VIEW young_people AS
SELECT name, age, city FROM people WHERE age < 28;

SELECT * FROM young_people;   -- use the view just like a table

-- ----------------------------------------------------------
-- STEP 20: Indexes (a helper that makes searching faster on big tables)
-- ----------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_city ON people(city);   -- speeds up searches by city

-- ----------------------------------------------------------
-- STEP 21: Union (stack results of two SELECTs together)
-- ----------------------------------------------------------
SELECT name FROM people WHERE city = 'Delhi'
UNION
SELECT name FROM people WHERE city = 'Pune';

-- ==========================================================
-- End of demo — you learned tables, filtering, sorting, grouping,
-- joins, string functions, subqueries, views, and more!
-- ==========================================================
