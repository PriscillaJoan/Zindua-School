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
