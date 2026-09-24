create database summa
use summa
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
    city VARCHAR(50),
    join_date DATE
);
select* from employees
INSERT INTO employees VALUES
(1, 'Arun', 50000, 'IT', 'Chennai', '2019-01-10'),
(2, 'Bala', 60000, 'HR', 'Madurai', '2021-03-15'),
(3, 'Cathy', 70000, 'IT', 'Chennai', '2018-07-23'),
(4, 'David', 40000, 'Sales', 'Coimbatore', '2022-06-01'),
(5, 'Eva', 80000, 'HR', 'Chennai', '2017-11-11'),
(6, 'Frank', 30000, 'Sales', 'Madurai', '2023-01-20'),
(7, 'Grace', 90000, 'IT', 'Chennai', '2016-09-09'),
(8, 'Helen', 55000, 'HR', 'Coimbatore', '2020-12-12'),
(9, 'Ishaan', 60000, 'Sales', 'Chennai', '2021-08-08'),
(10, 'John', 45000, 'IT', 'Madurai', '2019-05-05');
update employees set salary= salary+2000 where city ="chennai" and salary< 60000
update employees set salary= salary*1.1 where department ="IT"
delete from employees where join_date > "2022-12-31"
delete from employees where salary < 35000
update employees set department = "Admin" where department ="HR"
delete from employees where salary<20000
update employees set city ="Chennai" where name="Ravi"
alter table employees modify department varchar(100)
alter table employees add column phone_number varchar(15)
use summa
select * from employees where salary > 50000
select * from employees where salary < 30000
select * from employees where not department="HR"
select * from employees where city ="Chennai" and join_date > "2023-01-01"
select * from employees where not department="Sales"
select * from employees order by salary asc
select * from employees order by salary desc limit 3 
select * from employees order by join_date asc limit 4 offset 3
select * from employees limit 3 offset 2
select * from employees where department="IT" order by salary desc limit 3 offset 2
select * from employees where department = "Finance" order by join_date desc limit 2
select * from employees where salary > 50000 and city="Chennai" order by salary desc
select * from employees order by salary desc limit 3