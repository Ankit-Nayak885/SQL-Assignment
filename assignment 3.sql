use assignment

create table Employee(EID int,Ename varchar(30),Department varchar(30),Salary money)

insert into Employee values
(101,'Rakesh','IT',30000),
(102,'Priya','HR',28000),
(103,'Amit','Finance',45000),
(104,'Sneha','Marketing',35000),
(105,'Rahul','Sales',32000),
(106,'Neha','IT',40000),
(107,'Vikas','HR',29000),
(108,'Naresh','sales',65000),
(109,'Naksh','IT',80000),
(110,'Hussain','cloud',55000)
select * from employee

--1. / 3.
select Department,count(*) as Total_Employee
from Employee
group by Department

--2.
select Department,max(Salary)as 'highest salary',
avg(Salary) as 'average salary'
from Employee
group by Department

--4.
select Department, min(salary) as 'minimum salary'
from employee
group by Department

--5.
Select Department,count(*) as employee
from Employee
group by Department
having count(*) > 2

--6.
select Department,sum(salary) as 'Total salary'
from Employee
group by Department
having sum(salary)>100000

--7.
select Department,avg(Salary) as 'salary average'
from Employee
group by Department
having avg(Salary)>60000

--8.
select Department,count(*) as 'Total employee'
from Employee
group by Department
having count(*)=1

--9.
select * from Employee
order by salary desc

--10.
select * from employee
order by Ename

--11.
select * from Employee
order by Department,Ename



