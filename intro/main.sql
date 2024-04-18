-- Create database cmd is used to create the database 
CREATE DATABASE practice_db;

--create the table -create table cmd 
--Student table 
create table Student (
	name VARCHAR(100),
	id INT,
	age INT,
	gender VARCHAR(100),
	email VARCHAR(100)
);

--add some record in the student table 

INSERT INTO Student(id,name,age,gender,email)
VALUES(1222,'Arun',12,'Male','arun@122.in');

SELECT * from student

insert into student values('rahul',122,12,'MALE','rahul@122.in');

insert into student (name,age,email,gender,id) values ('arun',12,'arun@122.in','MALE',1222)

INSERT INTO student(name,email) VALUES('kira','arn@333.i')

-- single line comment we used --
-- for multiple line comment we use /* */
/*
this is multi line comments 
....
...
*/

SELECT name,id from student;
