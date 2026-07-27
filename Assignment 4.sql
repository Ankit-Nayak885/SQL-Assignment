--1.Add a new column Email to the Employee table.
create database CompanyDB

--2.Add a new column Email to the Employee table 

use CompanyDB
create table Employee
(
    EmpID int,
    FirstName varchar(30),
    LastName varchar(30),
    Department varchar(20),
    Designation varchar(20),
    Salary money,
    City varchar(30),
    Gender varchar(10) check (Gender IN ('M','F')),
    JoiningDate date,
    Age int check (Age >= 18)
)

--3.Add a new column Email to the Employee table.
alter table employee
add email varchar(30)

--4.Modify the Email column to increase its size.
alter table employee
alter column email varchar(40)

--5.Rename the column City to Location.
sp_rename 'Employee.city', 'location'

--6.Rename the table Employee to EmployeeDetails and then rename it back to Employee
sp_rename 'employee', 'employeeDetails'
sp_rename 'employeeDetails', 'employee'

--7.Drop the Email column from the Employee table
alter table employee
drop column email

--8.Write a query to check the structure (columns and data types) of the Employee table.
sp_help employee

--9. Make EmpID column the Primary Key of the Employee table.
alter table employee
add constraint PK_Employee
primary key(EID)

--10. Add a NOT NULL constraint on the FirstName column.
alter table employee
alter column firstname varchar(30) not null

--11. Add a UNIQUE constraint on the column to ensure no two employees have the same email (create a new column Email and apply the constraint).
alter table employee
add email varchar(30)
add constraint UQ_email
unique (email)

--12. Add a DEFAULT constraint on the Department column so that if no value is provided, it should be set as 'General'.
alter table employee
add constraint DF_department
default(department)
--13. Add a CHECK constraint on the Salary column so that salary cannot be less than 10,000.
alter table employee 
add constraint CHK_SALARY
check (salary > 10000)

--14. Add a CHECK constraint on the Age column so that age must be between 18 and 60.
alter table employee 
add constraint CHK_age
check (age between 18 and 60)

--15. Remove the CHECK constraint applied on the Salary column.
alter table employee
drop constraint CHK_salary

--16. Add a FOREIGN KEY unrelated simple self-constraint task: add a Manager_EmpID column and apply a CHECK constraint so it cannot be equal to EmpID itself.

select * from Employee
--17. Insert 15 records into the Employee table with different departments, cities, and salaries.
INSERT INTO Employee values
(201,'Aarav','Kapoor','Marketing','Executive',48000,'Chandigarh','M','2023-01-12',24,'aarav.kapoor@gmail.com'),
(202,'Isha','Malhotra','IT','Software Engineer',78000,'Bengaluru','F','2021-08-15',28,'isha.malhotra@gmail.com'),
(203,'Kabir','Chauhan','Finance','Accountant',56000,'Lucknow','M','2022-05-10',30,'kabir.chauhan@gmail.com'),
(204,'Meera','Nair','HR','Recruiter',45000,'Kochi','F','2023-03-21',26,'meera.nair@gmail.com'),
(205,'Yash','Deshmukh','Sales','Sales Executive',52000,'Nagpur','M','2022-09-18',27,'yash.deshmukh@gmail.com'),
(206,'Ananya','Reddy','IT','Team Lead',98000,'Hyderabad','F','2019-11-30',34,'ananya.reddy@gmail.com'),
(207,'Rohan','Gill','Operations','Supervisor',61000,'Ludhiana','M','2021-07-08',31,'rohan.gill@gmail.com'),
(208,'Diya','Sen','Customer Support','Support Executive',40000,'Kolkata','F','2024-02-14',23,'diya.sen@gmail.com'),
(209,'Vivaan','Sheikh','Research','Data Analyst',73000,'Bhopal','M','2020-10-19',29,'vivaan.sheikh@gmail.com'),
(210,'Sana','Ali','Finance','Finance Manager',105000,'Ahmedabad','F','2018-06-11',36,'sana.ali@gmail.com'),
(211,'Aditya','Pawar','Marketing','Digital Marketer',59000,'Pune','M','2022-12-05',27,'aditya.pawar@gmail.com'),
(212,'Nisha','Bose','IT','Database Admin',88000,'Chennai','F','2020-04-25',32,'nisha.bose@gmail.com'),
(213,'Harsh','Tiwari','Legal','Legal Advisor',69000,'Kanpur','M','2021-09-09',33,'harsh.tiwari@gmail.com'),
(214,'Kavya','Menon','HR','HR Manager',82000,'Thiruvananthapuram','F','2019-01-28',35,'kavya.menon@gmail.com'),
(215,'Zaid','Khan','Sales','Regional Manager',97000,'Jaipur','M','2018-08-17',38,'zaid.khan@gmail.com')

--18. Insert a new employee record without specifying the Department (to check the DEFAULT constraint).
insert into employee(EmpID,FirstName, LastName,Designation,Salary,location, Gender,JoiningDate, Age,email) values
(216, 'aniket','nayak', 'recruiter', 50000, 'rajasthan', 'F',  '2023-05-11',23,'nayakanik@gmail.com')

--19.Update the salary of all employees working in the IT department by increasing it by 10%.
update employee
set salary = Salary*1.10
where department = 'IT'

--20.Update the Designation of an employee whose EmpID is 5 to 'Senior Executive'.
update employee
set designation = 'Senior Executive'
where EmpID = 205

--21.Delete the record of an employee whose EmpID is 10.
delete from employee
where EmpID = 210

--22.Delete all employees whose Salary is less than 15,000.
delete from employee
where Salary < 15000

--23.Update the City of all employees from 'Mumbai' to 'Pune'.
update employee
set location = 'pune'
where location = 'Mumbai'
select * from employee

--24. Insert a record and intentionally leave FirstName blank to check if the NOT NULL constraint blocks it.
insert into employee(EmpID, LastName,department,Designation,Salary,location, Gender,JoiningDate, Age,email) values
(216, 'nayak', 'IT', 'recruiter',25000, 'mumbai', 'M',  '2023-05-11',23,'nayak@gmail.com')

--25. Write a query to display all the records from the Employee table.
select * from employee

--26. Write a query to display FirstName, LastName, and Salary of all employees.
select FirstName, LastName, Salary
from employee

--27. Write a query to display the details of employees working in the 'HR' department.
select * from employee
where Department = 'HR'

--28. Write a query to display all distinct Department names from the table.
select department from employee
group by Department

--29. Write a query to display the total number of employees in the table.
select count(Empid) from employee

--30. Write a query to display FirstName and Salary and rename the Salary column as MonthlySalary using an alias.
select firstname,
salary as monthlysalary
from employee

--31. Write a query to display all employee details whose Gender is 'F'.
select * from employee
where gender = 'F'

--32. Write a query to display the top 5 highest paid employees.
select top 5 * from employee
order by Salary desc 

--33.Display all employees whose Salary is greater than 30,000 (comparison operator).
select * from employee
where salary > 30000

--34.Display all employees whose Department is 'IT' AND Salary is greater than 25,000 (logical operator).
select * from employee
where Department = 'IT' and
salary > 25000

--35.Display all employees whose Department is 'HR' OR 'Finance'
select * from employee
where Department = 'HR' or
department = 'finance'
.
--36.Display all employees whose Salary is BETWEEN 20,000 and 40,000.
select * from employee
where salary between 20000 and 40000

--37.Display all employees whose City IN ('Delhi', 'Mumbai', 'Pune').
select * from employee
where location in ('delhi', 'mumbai', 'pune')

--38.Display all employees whose FirstName LIKE starts with 'A'.
select * from employee
where FirstName like 'a%'

--39.Display all employees whose FirstName LIKE ends with 'a'.
select * from employee
where FirstName like '%a'

--40.Display all employees whose Department is NOT 'Sales' (NOT operator).
select * from employee
where not Department = 'sales'

--41.Display the total number of employees in each department
select Department,count(*) as TotalEmployee
from employee
group by department 

--42.Display the average salary of employees department-wise.
select Department,avg(Salary) AvgSalary
from employee
group by department 

--43.Display the maximum salary in each department.
select Department,max(salary) as Maxsalary
from employee
group by department 

--44.Display the minimum salary city-wise.
select location,min(salary) as Minsalary
from employee
group by location

--45.Display the total salary paid, grouped by Designation.
select Designation,sum(salary) as totalSalary
from employee
group by Designation

--46.Display departments having more than 3 employees.
select Department,count(*) as totalemp
from employee
group by Department
having count(*) > 3

--47.Display departments whose average salary is greater than 30,000.
select Department,avg(salary) as Minsalary
from employee
group by Department
having avg(salary) > 30000

--48.Display cities having a total employee count greater than 2.
select location,count(*) as totalemp
from employee
group by location
having count(*) > 2

--49.Display all employee records sorted by Salary in descending order.
select * from employee
order by Salary desc

--50.Display all employee records sorted by Department (ascending) and then by Salary (descending)
select * from employee
order by Department,
salary desc
