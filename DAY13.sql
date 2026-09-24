create database inte
use inte
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
insert into employees values (11,'',40000,'IT','','2022-09-09');
select * from employees where id in (select id from employees where salary > 50000)
select * from employees where id <all (select id from employees where salary> 45000)