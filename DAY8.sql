create database testing2
use testing2
CREATE TABLE salary(sid  int primary key, srange int)
insert into salary values(1,40000),(2,50000),(3,60000)
CREATE TABLE dept(did int primary key AUTO_INCREMENT, department varchar(30))
insert into dept(department) values ("it"),("hr"),("testing")
create table employee(empid int primary key AUTO_INCREMENT, ename varchar(20),sid int, did int,FOREIGN KEY(sid)REFERENCES salary(sid), FOREIGN KEY (did) REFERENCES dept(did))AUTO_INCREMENT=101
insert into employee(ename,sid,did) values ("akash",1,2),("maha",2,3)
INSERT INTO employee(ename, sid, did)
VALUES
('Ajay', 3, 1),
('Kumar', 1, 1),
('Kesav', 2, 2),
('Ravi', 3, 3),
('Prakash', 1, 1),
('Vijay', 2, 2),
('Anand', 3, 3),
('Surya', 1, 1);
create table empdetails(sno int primary key AUTO_INCREMENT, rollno int,ename varchar(20),age int,dob date,city varchar(30),FOREIGN KEY(rollno)REFERENCES employee(empid))
insert into empdetails (rollno, ename, age, dob, city)
values
(101, 'Arun', 23, '2003-03-23', 'Chennai'),
(102, 'Aakash', 24, '2002-05-14', 'Madurai')
INSERT INTO empdetails (rollno, ename, age, dob, city)
VALUES
(103, 'Ajay', 25, '2001-07-18', 'Dindigul'),
(104, 'Kumar', 26, '2000-03-23', 'Chengalpattu'),
(105, 'Kesav', 27, '1999-11-10', 'Chennai'),
(106, 'Ravi', 22, '2004-01-25', 'Coimbatore'),
(107, 'Prakash', 28, '1998-09-12', 'Trichy'),
(108, 'Vijay', 24, '2002-12-05', 'Salem'),
(109, 'Anand', 25, '2001-06-30', 'Thanjavur'),
(110, 'Surya', 23, '2003-08-16', 'Madurai')
select * from empdetails
select a.ename,b.age,b.ename,b.dob,b.city from employee as a inner join empdetails as b on a.empid=b.rollno
select a.ename,b.age,b.ename,b.dob,b.city from employee as a left join empdetails as b on a.empid=b.rollno

select a.ename,b.age,b.ename,b.dob,b.city from employee as a inner join empdetails as b on a.empid=b.rollno
union all
select a.ename,b.age,b.ename,b.dob,b.city from employee as a inner join empdetails as b on a.empid=b.rollno 
select a.ename,b.age,b.ename,b.dob,b.city from employee as a inner join empdetails as b on a.empid=b.rollno where b.age=21


