create database School;
use School;

#create table student
create table student(
stud_id int primary key,
first_name varchar (100),
last_name varchar (100),
age int check (age >= 18),
email varchar (255) unique
);

select * from student;

insert into student (stud_id,first_name,last_name,age,email)
values
(1,'John','Doe',20,'john.doe@example.com'),
(2,'Jane','Smith' , 22 , 'jane.smith@example.com'),
(3,'Micheal' , 'Brown' , 19 , 'micheal.brown@exapmle.com');

alter table student
add enrollment_date date,
modify email varchar (300);

alter table student
drop last_name;

-- select multiple columns
SELECT first_name,age FROM student;

-- filter rows using WHERE clause
SELECT first_name,age FROM student WHERE age>20;

-- filter row based on multiple conditions
SELECT first_name,email,stud_id
FROM student
WHERE age>18
AND stud_id>1;

SELECT * FROM student ORDER BY age ASC;

-- order by and limit
SELECT * FROM student
ORDER BY age DESC
LIMIT 2;

-- sort my data with email and age
SELECT first_name,email,age FROM student 
GROUP BY email 
ORDER BY age ASC;

-- using DISTINCT to get unique values
SELECT DISTINCT email FROM student;
-- email address of students older than 18 ordered in alphabetical order
SELECT DISTINCT email from student
WHERE age > 20
ORDER BY email ASC;

-- logical operators AND OR NOT
-- AND all conditions must be true
-- OR any one of the conditions must be true