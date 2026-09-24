#Aggregate operation
create database invoicee
use invoicee
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
insert into employees(id,salary,department,join_date) values (11,40000,'IT','2022-09-09');
select count(*) from employees
select count(salary) from employees
select sum(salary) from employees
select avg(salary) from employees
select max(salary) from employees
select min(salary) from employees
select count(id), salary from employees group by salary
select count(id) as temp, salary from employees group by salary having temp=2
-----------------------------------TASK----------------------------------------------
select distinct department from employees
select * from employees where join_date between "2019-01-01" and "2021-12-31"
select * from employees where name like"%a"
select * from employees order by join_date asc
select min(salary)  from employees 
select max(salary)  from employees 
select avg(salary) ,city from employees group by city
select sum(salary), department from employees group by department
select count(id), department from employees group by department
select department ,sum(salary) as tem from employees group by department having sum(salary)> 150000 
select department , count(id) as temp from employees group by department having count(id)>2
select department,avg(salary) as temp from employees group by department limit 2
select department, sum(salary) as temp from employees group by department limit 1