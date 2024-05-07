create TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Position VARCHAR(50)
);

INSERT INTO
    Employee (
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Position
    )
VALUES (
        1,
        'John',
        'Doe',
        'IT',
        'Software Engineer'
    ),
    (
        2,
        'Jane',
        'Smith',
        'HR',
        'HR Manager'
    ),
    (
        3,
        'Mike',
        'Johnson',
        'Finance',
        'Accountant'
    ),
    (
        4,
        'Emily',
        'Brown',
        'Marketing',
        'Marketing Specialist'
    ),
    (
        5,
        'David',
        'Jones',
        'IT',
        'System Administrator'
    ),
    (
        6,
        'Sarah',
        'Wilson',
        'Finance',
        'Financial Analyst'
    ),
    (
        7,
        'Michael',
        'Davis',
        'HR',
        'Recruiter'
    ),
    (
        8,
        'Jennifer',
        'Martinez',
        'Marketing',
        'Marketing Coordinator'
    ),
    (
        9,
        'Chris',
        'Anderson',
        'IT',
        'Web Developer'
    ),
    (
        10,
        'Lisa',
        'Taylor',
        'Finance',
        'Financial Manager'
    );

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(50, 2),
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);

INSERT INTO
    Salary (
        SalaryID,
        EmployeeID,
        Salary,
        Date
    )
VALUES (1, 1, 75000.00, '2024-04-01'),
    (2, 2, 90000.00, '2024-04-01'),
    (3, 3, 65000.00, '2024-04-01'),
    (4, 4, 70000.00, '2024-04-01'),
    (5, 5, 80000.00, '2024-04-01'),
    (6, 6, 85000.00, '2024-04-01'),
    (7, 7, 70000.00, '2024-04-01'),
    (8, 8, 75000.00, '2024-04-01'),
    (9, 9, 80000.00, '2024-04-01'),
    (
        10,
        10,
        95000.00,
        '2024-04-01'
    );

-- return all employee with salary
SELECT e.FirstName, e.LastName, s.Salary
FROM Employee as e, salary as s;

-- return a employee name whose salary is highest
select e.FirstName,e.lastName,e.position,s.salary
from employee as e , salary as s
ORDER BY s.salary DESC LIMIT 1;

-- return a employee name whose salary is lowest
select e.FirstName,e.lastName,e.position,s.salary
from employee as e , salary as s
ORDER BY s.salary ASC LIMIT 1;

-- return the second  highest unique salary 
select e.firstName,e.lastName,e.position,s.salary from employee as e ,salary as s
WHERE s.salary not in (SELECT Max(Salary) FROM Salary)
ORDER BY s.salary DESC LIMIT 1;


-- Limit the result to the second-lowest salary
select e.firstName, e.lastName, e.position, MAX(s.salary)
from employee as e, salary as s
where s.salary not in (
	select min(salary) from salary
)
GROUP BY e.firstName ,e.lastName,e.position,s.salary
ORDER BY s.salary ASC LIMIT 1 ;
