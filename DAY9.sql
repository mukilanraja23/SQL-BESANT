CREATE DATABASE mukil;
USE mukil;

CREATE TABLE department (did INT PRIMARY KEY, department VARCHAR(30),location VARCHAR(30));
INSERT INTO department VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Coimbatore'),
(3, 'Finance', 'Madurai'),
(4, 'Marketing', 'Trichy'),
(5, 'Sales', 'Chennai'),
(6, 'Testing', 'Bangalore'),
(7, 'Development', 'Hyderabad'),
(8, 'Support', 'Pune'),
(9, 'Admin', 'Chennai'),
(10, 'Research', 'Bangalore'),
INSERT INTO department VALUES
(11, 'Security', 'Hyderabad'),
(12, 'Design', 'Coimbatore'),
(13, 'Operations', 'Madurai'),
(14, 'Legal', 'Chennai'),
(15, 'Training', 'Pune');

CREATE TABLE employee (empid int primary key,ename varchar(30),salary int,did int,manager_id int, foreign key (did) references department(did));

INSERT INTO employee VALUES
(101, 'Arun', 45000, 1, 102),
(102, 'Bala', 50000, 1, 101),
(103, 'Charan', 40000, 2, 103),
(104, 'Deepa', 55000, 3, 105),
(105, 'Elango', 48000, 4, 106),
(106, 'Fathima', 60000, 5, 104),
(107, 'Gokul', 52000, 6, 107),
(108, 'Hari', 47000, 7, 108),
(109, 'Ishitha', 65000, 8, 109),
(110, 'Jeeva', 42000, 9, 110),
(111, 'Karthik', 70000, 10, 112),
(112, 'Lokesh', 58000, 11, 111),
(113, 'Manoj', 46000, 12, 113),
(114, 'Naveen', 62000, 13, 115),
(115, 'Priya', 75000, NULL, 114);
select d.department, COUNT(e.empid) as temp from department d left join employee e on d.did = e.did group by d.did, d.department;
select d.did, COUNT(e.empid) as temp from department d left join employee e on d.did = e.did group by d.did, d.department;
select e.*,d.* from employee e left join department d on e.did=d.did where e.ename like "%n"
select * from employee  where (select from employee e join department d on e.did=d.did where e.ename like "%n")
