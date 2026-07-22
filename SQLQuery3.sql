use assignment

create table employee
(EmployeeID int,Name varchar(255),Department varchar(255),Salary money,Bonus money,Experience int,City varchar(255))

 insert into employee values
(101, 'Amit', 'IT', 65000, 5000, 6, 'Mumbai'),
(102, 'Riya', 'HR', 48000, 3000, 4, 'Delhi'),
(103, 'Arjun', 'IT', 55000, 4500, 7, 'Pune'),
(104, 'Sneha', 'Finance', 70000, 6000, 9, 'Mumbai'),
(105, 'Ajay', 'IT', 42000, 2000, 3, 'Delhi'),
(106, 'Neha', 'Sales', 50000, 3500, 5, 'Jaipur'),
(107, 'Ankit', 'HR', 62000, 4000, 8, 'Delhi'),
(108, 'Priya', 'IT', 58000, 5500, 6, 'Ahmedabad'),
(109, 'Rahul', 'Finance', 47000, 2500, 2, 'Mumbai'),
(110, 'Aman', 'Sales', 53000, 3000, 7, 'Delhi')

--1.
select *from employee
where Salary>50000

--2.
select *from employee
where Department='IT' and Experience>5

--3.
select *from employee
where Salary between 45000 and 60000

--4.
select *from employee
where city in ('Mumbai','Delhi')

--5.
select 'Sneha',Salary*12
from employee
where Name='Sneha'

--6.
select *from employee
where Name like 'A%'

--7.
select max(Salary)
from employee

--8./ 11.
SELECT sum(Bonus)
FROM Employee
WHERE Department = 'IT'

--9.
select min(Experience) as minimum_exp  ,max(Experience) as maximum_exp
from employee

--10.
select department, count(Department) as total_employee
from employee
group by department

--12.
alter table Employee
add Email varchar(100)
select*from employee

--13.
alter table Employee
alter column Salary decimal(10,2)
select * from Employee

--14.
alter table Employee
drop column Bonus 
select * from Employee











