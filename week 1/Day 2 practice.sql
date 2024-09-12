-- create an employee database and have the columns id,name,age,department,salary and hiredate

create schema employees;
USE employees;

-- Create table
CREATE table employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (255),
age INT,
department VARCHAR (100),
salary INT ,
hire_date DATE 
);

INSERT INTO employees ( name, age, department, salary, hire_date)
values
('John Muvevi', 30, 'HR' , 50000, '2019-10-03'),
('Joan Wanjiru' , 26 , 'IT' , 100000 , '2023-05-01'),
('Angela Wanjiku' , 28 , 'Marketing' , 700000 , '2017-07-03'),
('Jane Njoroge' , 35 , 'Finance' , 70000 , '2017-07-03'),
('Martin Muoti' , 32 , 'IT', 110000 , '2018-05-03'),
('Mark Otieno', 26 , 'Finance' , 70000 , '2018-05-02'),
('Judith Njeri' , 28 , 'Operations' , 60000 , '2023-05-01'),
('Moses Njoroge' , 33 , 'IT' , 100000 , '2017-07-03'),
('Priscilla Wanjiru', 30 , 'HR' , 50000 , '2024-05-10'),
('Jackson Omondi' , 25 , 'Communications' , 50000 , '2017-07-03');

-- select specific columns name age salary
SELECT name , age , salary FROM employees;

-- filter records name salary of employees working in a department
SELECT name, salary, department FROM employees
WHERE department IN ('IT', 'HR');

-- sort the data by salary
SELECT * FROM employees
ORDER BY salary ASC;

-- find the top 3 highest paid employees
SELECT name,department,salary FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Modify Angela's salary from 700,000 to 70,000
UPDATE employees
SET salary = 70000
WHERE name = 'Angela Wanjiku' AND id=3;

-- Find all the unique departments you can find
SELECT DISTINCT department FROM employees;

-- query data such that you have employees who are either in department x or have a salary y
SELECT name,department,salary FROM employees
WHERE department = 'Marketing' OR salary = 50000;

-- select 2 youngest employees and show name and date they were hired
SELECT name, hire_date, age FROM employees
ORDER BY age ASC
LIMIT 2;

-- find the distinct departments and sort them in alphabetical order
SELECT DISTINCT department FROM employees 
ORDER BY department ASC;
