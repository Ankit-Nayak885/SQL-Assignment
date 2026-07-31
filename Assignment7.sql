--1. Display each employee's name and their corresponding department name. 
select E.Ename,D.Dname 
from Employee E
inner join Department D
on E.DID=D.DID

--2. List all projects along with the name of the employee assigned to them. 
select E.Ename,P.Pname 
from Project P
left join Employee E
on P.EID=E.EID

--3. Show the names of employees and the names of their managers. 
select Ename,Mname
from Employee E
inner join Manager M
on E.MID=M.MID

--4. Display the Project ID and the Department ID for every project. 
select P.PID,P.Pname,E.DID
from Project P
inner join Employee E
on P.EID=E.EID

--5. List employees who work in the 'IT' department.
select Ename,Dname
from Employee E
inner join Department D
on E.DID=D.DID
where Dname = 'IT'

--6.  Display employee names and their manager names for all employees in department D1.
select Ename,Mname
from Employee E
inner join Manager M
on E.MID=M.MID
where E.DID='D1'

--7. Show all projects handled by ‘Suresh’. 
select E.Ename,P.Pname
from Employee E
left join Project P
on E.EID=P.EID
where Ename ='Suresh'

--8.Find the department name associated with Project ID 101. 
select D.Dname,P.PID,E.EID
from Department D
inner join Employee E
on D.DID=E.DID
inner join Project P
on E.EID=P.EID
where PID='P2'

--9. List all employees whose manager's name is 'Suresh'. 
select Ename
from employee E
left join Manager M
on E.MID=M.MID
where Mname ='Suresh'

--10. Display the count of employees in each department name. 
select Dname,count(EID) as Total_Emp
from Employee E
right join Department D
on E.DID=D.DID
group by D.Dname

--11.  List all departments and the employees working in them (including departments with no employees).
select Dname,Ename
from Department D
left join Employee E
on D.DID=E.DID

--12.  Display all employees and the projects they are assigned to (including those with no projects).
select E.Ename,P.PID,P.Pname
from  Employee E
left join Project P
on E.EID=P.EID

--13.  Show the names of employees, their department names, and their manager names in one result. 
select  E.Ename,D.Dname,M.Mname
from Employee E
inner join Department D
on E.DID=D.DID
inner join manager M
on E.MID=M.MID

--14. Find all projects and the department name they belong to.
select P.Pname,D.Dname
from project P
left join Employee E 
on P.EID=E.EID
left join Department D
on E.DID=D.DID

--15.  List all managers and the names of employees reporting to them (including managers with no reporters).
select Mname,Ename
from Manager M
left join Employee E
on M.MID=E.MID

--16. Find employees who are NOT assigned to any project.
select E.Ename
from Employee E
left join Project P
on E.EID=P.EID
where P.PID IS NULL

--17.  Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.
select E.Ename,P.Pname
from Employee E
left join Project P
on E.EID=P.EID
inner join Department D
on E.DID=D.DID
where Dname ='IT'

--18.  Show the names of managers who are managing employees in the 'AI' department. 
select M.Mname,D.Dname,D.DID
from Manager M
inner join Department D
on M.DID=D.DID
where Dname ='AI'

--19.Display Department Name, Employee Name, and Project Name for all matches. 
select Dname,Ename,Pname
from Department D
inner join Employee E
on D.DID=E.DID
inner join Project P
on E.EID=P.EID

--20. . List all projects and the manager's name responsible for the employee assigned to that project.
select Pname as Project_name,Mname as Manager_name
from Project P
left join Employee E
on P.EID=E.EID
left join Manager M
on E.MID=M.MID

select *from Employee
select * from Department
select *from manager
select *from Project

