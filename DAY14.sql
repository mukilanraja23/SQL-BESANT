use inte
with cte as
(select * from employees where salary=60000 
union
 select * from employees where salary=50000
 union
 select * from employees where salary=40000
)
select * from cte
with cte as
(SELECT name from employees where salary >50000
)
select * from cte
use testing2
with cte as
(select a.ename as employeename,b.age,b.ename as bname,b.dob,b.city from employee as a inner join empdetails as b on a.empid=b.rollno
) select * from cte

with cte as
(select a.ename from employee a inner join empdetails b on a.empid=b.rollno)
select * from cte
 with cte1 as
 (SELECT * from employee ),
 cte2 as
 (SELECT * from empdetails)
 select a.ename,b.age,b.ename,b.dob,b.city from cte1 a inner join cte2 b on a.empid=b.rollno