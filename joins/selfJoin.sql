drop TABLE emp;
create table emp (
    emp_id NUMERIC,
    emp_name VARCHAR(50),
    manager_id NUMERIC
);

INSERT INTO
    emp (emp_id, emp_name, manager_id)
VALUES (1, 'Alice', NULL),
    (2, 'Bob', 1),
    (3, 'Charlie', 1),
    (4, 'David', 2),
    (5, 'Eve', 2);

SELECT* from emp;

-- To find the names of employees along with their managers' names,
select e1.emp_name as Employee,e2.emp_name as Manager
from emp as e1
JOIN emp as  e2
on e1.manager_id=e2.emp_id;
