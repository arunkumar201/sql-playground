-- Active: 1712767786781@@127.0.0.1@5433@practice_db
select * from employee;

select * from salary;

SELECT e.firstName, CONCAT(e.firstName, ' ', e.lastName) AS fullName, s.salary
FROM employee AS e, salary AS s
where
    e.employeeId = s.salaryId
ORDER BY s.salary DESC;

--union will only select the distinct values
--if we want to select all value(with Duplicates) we can use
-- union ALL
SELECT employeeId
from employee
    -- UNION 
UNION ALL
select salaryId as salary_id
from salary;

-- USING INNER JOIN

SELECT *
from employee as e
    INNER JOIN salary as s on e.employeeId = s.salaryId;

-- inner join will join two tables and return the data those are
-- common is both tables
SELECT *
from employee as e
    INNER JOIN salary as s on e.employeeId = s.salaryId
ORDER BY s.salary DESC;

-- Left join - it will return the result from left table +(data which matches the condition in right table else set as null)
--returns all records from the left table and matched records from the right table
SELECT *
from employee as e
    LEFT JOIN salary as s on e.employeeId = s.salaryId;
-- Right join - it will return the result from right table +(data which matches the condition in left table else set as null
--returns all records form the right table and matched records from the left table
SELECT *
from employee as e
    RIGHT JOIN salary as s on e.employeeId = s.salaryId

-- full outer join - returns all records if there is match in either left table or right table
SELECT *
from employee as e FULL OUTER
    JOIN salary as s on e.employeeId = s.salaryId;
