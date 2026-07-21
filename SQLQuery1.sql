use assignment

create table employee
(Eid int,Ename varchar(20),Eage int,Edepartment varchar(20),Esalary money)

insert into employee values
(101,'rakesh',26,'cloud',35000),
(102,'naresh',35,'finance',20000),
(103,'deepak',28,'HR',30000),
(100,'ankit',29,'AI',25000)
select* from employee

--1.
select Sname from student
where Sage=25

--2.
select 7*4

--3.
select (7-4)*8

select* from student

--4.
select 'Brewster’s SQL Training 
Class'

--5.
select 'Day 1 of Training',
5*3

--Insert/Update/Delete 

--1.
insert into employee values
(105,'mahesh',25,'finance',25000)

--2.
insert into employee values 
(204,'mahesh',25,'HR',25000),
(205,'suresh',35,'HR',45000),
(206,'dhairya',29,'HR',70000)

--3.
insert into employee(Eid,Ename,Eage,Edepartment)values
(106,'amit',32,'finance')

--4.
update employee
set Esalary=85000
where Edepartment='cloud'
select *from employee

--5.
update employee
set Edepartment='finance',
Esalary=40000
where Ename='deepak'

--6.
update employee
set Esalary=Esalary*1.10
where Edepartment='AI'

--7.
update employee 
set Esalary=30000
where Esalary is NULL


--8.
delete from employee
where Eid=103

--9.
delete from employee
where Edepartment = 'finance'

--10.
delete from employee
where Edepartment = 'finance'
and Esalary < 20000
select *from employee