create database enjoy
use enjoy
create table employees (REG_ID int ,DEPAT_NAME varchar(10),SALARY int);
insert into employees values
(101,"IT",5000),
(102,"IT",4000),
(103,"IT",2000),
(104,"IT",1000),
(105,"HR",5000),
(106,"HR",3000),
(107,"HR",2000),
(108,"MRK",6000),
(109,"MRK",5000),
(110,"SALES",4000),
(111,"SALES",3000),
(112,"SALES",2000);
insert into employees values (113,"IT",5000),(114,"HR",5000),(115,"MRK",6000),(116,"SALES",3000)

SELECT *,row_number() over (partition by DEPAT_NAME order by SALARY desc) as RNO from employees
SELECT *, rank() over (partition by DEPAT_NAME order by SALARY desc) as RANKE from employees
SELECT  sum(SALARY) over (partition by DEPAT_NAME ) as rno from employees 
select *,lead(SALARY,1)over(partition by SALARY desc) as NEXTS 