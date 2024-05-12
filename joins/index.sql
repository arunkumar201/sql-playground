-- Active: 1712767786781@@127.0.0.1@5433@practice_db
select * from employee;

select * from salary;

SELECT e.firstName, CONCAT(e.firstName, ' ', e.lastName) AS fullName, s.salary
FROM employee AS e, salary AS s
where e.employeeId=s.salaryId
ORDER BY s.salary DESC;

 --union will only select the distinct values 
 --if we want to select all value(with Duplicates) we can use 
 -- union ALL
SELECT employeeId from 
employee
-- UNION 
UNION ALL
select salaryId as salary_id from salary;

