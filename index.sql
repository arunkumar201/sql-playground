-- Active: 1720932518269@@localhost@5432@postgres@public
SELECT *  FROM "User"
WHERE ROLE!='BASIC'

SELECT NAME,NAME,ROLE from "User"

select name,role from "User"

where role='BASIC'

SELECT * FROM "User"
WHERE ROLE='BASIC'

-- create user table 
CREATE TABLE "User" (
    ID SERIAL PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	ROLE VARCHAR(50) NOT NULL
);

-- insert data
INSERT INTO "User" (NAME, ROLE) VALUES ('John Doe', 'ADMIN');
INSERT INTO "User" (NAME, ROLE) VALUES ('Jane Doe', 'BASIC');
INSERT INTO "User" (NAME, ROLE) VALUES ('Alice', 'BASIC');

--select users
SELECT * FROM "User"

-- update user role
UPDATE "User"
SET ROLE='ADMIN',NAME='Arun Kumar'
where id=3

--delete values in the table 
DELETE FROM "User"
WHERE ID=1

--alter table- used to add, delete or modify columns in an existing table
ALTER TABLE "User"
ADD COLUMN STATUS VARCHAR(50);

ALTER table "User"
add COLUMN dummy VARCHAR(50);

--delete an existing column
ALTER TABLE "User"
DROP COLUMN dummy;

--alter the existing column 
ALTER TABLE "User"
ALTER COLUMN STATUS TYPE VARCHAR(10)

--update values in the new column
UPDATE "User"  
SET STATUS='INACTIVE'
--select users

SELECT * FROM "User"

--drop table
--drop table cmd used to deletes a table and all its data from the database
DROP TABLE "User";

--truncate table- this cmd is used to delete all the rows from the table but the table structure remains same
TRUNCATE TABLE "User";

--operators in sql
-- = equality
-- != <> not equal
-- > greater than
-- < less than
-- >= greater than or equal to
-- <= less than or equal to
-- BETWEEN a range
-- LIKE pattern matching
-- IN a list of values
-- IS NULL or IS NOT NULL

-- SELECT statement with operators
SELECT * FROM "User"

-- = equality
select * from "User"
WHERE id%2=0
ORDER BY id DESC
LIMIT 1
OFFSET 1


-- != <> not equal
SELECT * FROM "User"
WHERE id!=4;

-- > greater than
SELECT * FROM "User"
WHERE id>7;

-- < less than
SELECT * FROM "User"
WHERE id<3;

-- >= greater than or equal to
SELECT * FROM "User"
WHERE id>=5;

-- <= less than or equal to
SELECT * FROM "User"
WHERE id<=3;

-- BETWEEN a range
SELECT * FROM "User"
WHERE id BETWEEN 3 AND 7;

-- LIKE pattern matching
SELECT * FROM "User"
WHERE name LIKE '%e';

-- IN a list of values
SELECT * FROM "User"
WHERE id IN (5, 10, 15);

--add new column
ALTER TABLE "User"
ADD COLUMN status VARCHAR(50);
-- IS NULL or IS NOT NULL
SELECT * FROM "User"
WHERE status IS NOT NULL;

-- update status
UPDATE "User"
SET status='ACTIVE'
WHERE id IN (5, 10, 15);

-- delete inactive users
DELETE FROM "User"
WHERE status='INACTIVE';

-- ORDER BY clause
SELECT * FROM "User"
