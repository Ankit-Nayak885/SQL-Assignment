--1. Create a database for the Collegerecords. 
create database Collegerecords

use CollegeRecords

--2. Create the Department table. 
create table Department(DepartmentID INT primary key, DepartmentName varchar(50))

--3)Create the Student table with all required columns.
create table Student(RollNo int primary key, StudentName varchar(50), Course varchar(50), Marks int, City varchar(50), Gender char(1), Age int, AdmissionDate date, Fee money, DepartmentID int foreign key references Department(DepartmentID))

--4)Add a new column to the Student table to store the student's email address.
alter table Student 
add Semail varchar(30)

--5)Modify the data type/size of the email column you just added.
alter table Student 
alter column Semail varchar(60)

--6)Rename the newly added email column to something more suitable.
exec sp_rename 'Student.Semail', 'SEmail'

--7)Drop the email column from the Student table.
alter table student
drop column SEmail

--8)Rename the Student table to StudentRecords and then rename it back to Student.
exec sp_rename 'student', 'StudentRecords'

exec sp_rename 'StudentRecords', 'student'

--9)Write a query to view the complete structure of the Student table.
exec sp_help student 

--10)Write a query to view the complete structure of the Department table.
exec sp_help Department

--11)Truncate all the data from the Department table and recreate it.
truncate table department

--12)Drop the Department table and create it again with the same structure.
drop table Department

create table Department (DepartmentID INT primary key, DepartmentName varchar(50))

--13) Set the primary key on the Department table.
alter table Department
add constraint PK_dep primary key (DepartmentID)

--14) Set the primary key on the Student table.
alter table student 
add constraint PK_stu primary key (RollNo)

--15) Add a foreign key on the Student table that references the Department table.
alter table student
add constraint FK_stu foreign key (DepartmentID) references Department(DepartmentID)

--16) Try inserting a student record with a department value that does not exist in the Department table and observe the result.
insert into student values (26,'karan Ahuja','Computer Science',70,'Delhi','M',24,'2024-07-01',48000,999)

--17) Apply a NOT NULL constraint on the student's name column.
alter table student
alter column StudentName varchar(50) NOT NULL

--18) Apply a NOT NULL constraint on the course column.
alter table student
alter column course varchar(50) NOT NULL

--19) Apply a UNIQUE constraint on a column that stores each student's roll number.
alter table student
add constraint Unik Unique (RollNo)

--20) Apply a UNIQUE constraint on the email column (add the column again if you had dropped it earlier)
alter table student
add constraint Unik_mail Unique (StuEmail)

--21) Apply a DEFAULT constraint on the city column with a default value of your choice.
alter table student 
add constraint def_city Default 'Vadodara' for City

--22) Apply a DEFAULT constraint on the fee column with a default value.
alter table student
add constraint def_fee Default '20000' for Fee

--23) Apply a CHECK constraint on the marks column so that marks cannot be negative or greater than 100.
alter table student 
add constraint chk_marks Check(Marks between 0 and 100)

--24) Apply a CHECK constraint on the age column so that age must be greater than or equal to 15.
alter table student 
add constraint chk_age Check(Age >= 15)

--25) Apply a CHECK constraint on the gender column so that only 'M' or 'F' can be
alter table student 
add constraint chk_gender Check(gender in ('M', 'F')) 

--26) Remove the CHECK constraint applied on the age column.
alter table student 
drop constraint chk_age

--27) Remove the UNIQUE constraint applied on the roll number column.
alter table student 
drop constraint Unik

--28) Remove the DEFAULT constraint applied on the fee column.
alter table student 
drop constraint def_fee

--29) Remove the foreign key constraint from the Student table.
alter table student 
drop constraint FK_stu

--30) Add the foreign key constraint back to the Student table.
alter table student 
add constraint FK_stu foreign key (DepartmentID) references Department(DepartmentID)

--31) Remove the primary key from the Department table and then reapply it.
alter table Department 
drop constraint PK_dep

alter table Department
add constraint PK_dep primary key (DepartmentID)

--32) Try deleting a department from the Department table that is still referenced by a student and observe the result.
delete from Department where DepartmentID = 1

--33) Insert 5 records into the Department table.
INSERT INTO Department (DepartmentID, DepartmentName) VALUES	(1, 'Computer Science'),
																(2, 'Commerce'),
																(3, 'Arts'),
																(4, 'Science'),
																(5, 'Management')

--34) Insert 20 records into the Student table with varied courses, cities, marks, and fees
INSERT INTO Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID) VALUES
(1, 'Aarav Sharma', 'Computer Science', 88, 'Delhi', 'M', 19, '2022-07-15', 45000, 1),
(2, 'Priya Singh', 'Commerce', 76, 'Jaipur', 'F', 20, '2022-07-16', 30000, 2),
(3, 'Rohan Verma', 'Computer Science', 92, 'Mumbai', 'M', 21, '2022-07-18', 46000, 1),
(4, 'Sneha Patel', 'Arts', 65, 'Ahmedabad', 'F', 19, '2022-07-20', 20000, 3),
(5, 'Karan Mehta', 'Computer Science', 58, 'Delhi', 'M', 18, '2022-07-21', 44000, 1),
(6, 'Anjali Gupta', 'Commerce', 81, 'Pune', 'F', 20, '2022-07-22', 31000, 2),
(7, 'Vikram Rao', 'Science', 70, 'Jaipur', 'M', 22, '2022-07-25', 38000, 4),
(8, 'Divya Nair', 'Computer Science', 95, 'Mumbai', 'F', 20, '2022-07-26', 47000, 1),
(9, 'Arjun Kapoor', 'Commerce', 45, 'Delhi', 'M', 19, '2022-07-28', 29000, 2),
(10, 'Neha Joshi', 'Arts', 55, 'Ahmedabad', 'F', 21, '2022-07-29', 21000, 3),
(11, 'Rahul Yadav', 'BBA', 68, 'Pune', 'M', 20, '2022-08-01', 35000, 5),
(12, 'Kavita Reddy', 'Computer Science', 84, 'Jaipur', 'F', 19, '2022-08-02', 45500, 1),
(13, 'Aditya Malhotra', 'Science', 30, 'Delhi', 'M', 18, '2022-08-03', 37000, 4),
(14, 'Pooja Iyer', 'Commerce', 90, 'Mumbai', 'F', 21, '2022-08-05', 32000, 2),
(15, 'Suresh Kumar', 'Computer Science', 77, 'Ahmedabad', 'M', 22, '2022-08-06', 46000, 1),
(16, 'Meera Desai', 'Arts', 60, 'Pune', 'F', 20, '2022-08-07', 22000, 3),
(17, 'Sanjay Chauhan', 'BBA', 72, 'Jaipur', 'M', 19, '2022-08-10', 36000, 5),
(18, 'Ritu Bhatt', 'Commerce', 85, 'Delhi', 'F', 20, '2022-08-11', 33000, 2),
(19, 'Manish Trivedi', 'Computer Science', 98, 'Mumbai', 'M', 21, '2022-08-12', 48000, 1),
(20, 'Swati Agarwal', 'Science', 40, 'Ahmedabad', 'F', 19, '2022-08-14', 39000, 4)

--35) Insert a record into the Student table without providing a value for the city column, to check the DEFAULT constraint
INSERT INTO Student (RollNo, StudentName, Course, Marks, Gender, Age, AdmissionDate, Fee, DepartmentID)
VALUES (31, 'Ananya Bose', 'Commerce', 74, 'F', 20, '2022-09-01', 30000, 2)

SELECT RollNo, StudentName, City FROM Student WHERE RollNo = 31

--36) Insert a record into the Student table without providing a value for the fee column, to check the DEFAULT constraint.
INSERT INTO Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, DepartmentID)
VALUES (32, 'Kabir Malik', 'Science', 62, 'Pune', 'M', 20, '2022-09-02', 4)

SELECT RollNo, StudentName, Fee FROM Student WHERE RollNo = 32;

--37) Update the marks of a student whose roll number is a specific value, increasing it by 5.
update student set Marks = Marks + 5 where RollNo = 5

--38) Update the fee amount of all students belonging to a particular course.
update student set Fee = Fee + 1000 where Course = 'Commerce'

--39) Update the city of a student from one city to another.
update student set city = 'Pune' where RollNo = 9

--40) Update the department of a student to a different valid department.
update student set DepartmentID = 3 where RollNo = 3

--41) Delete the record of a student with a specific roll number.
delete from student where RollNo = 32

--42) Delete all students whose marks are less than 35.
delete from student where Marks < 35

--43) Delete all students belonging to a particular city.
delete from student where City = 'Pune'

--44) Insert a record leaving the student name blank and check whether the NOT NULL constraint blocks it.
INSERT INTO Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID)
VALUES (40, NULL, 'Arts', 60, 'Delhi', 'M', 19, '2024-07-01', 20000, 3)

--45) Insert a record with a duplicate roll number and check whether the UNIQUE constraint blocks it.
INSERT INTO Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID)
VALUES (5, 'Duplicate Test', 'Arts', 50, 'Delhi', 'M', 20, '2024-07-01', 20000, 3)

--46) Insert a record with age less than the allowed minimum and check whether the CHECK constraint blocks it.
INSERT INTO Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID)
VALUES (41, 'Young Applicant', 'Arts', 60, 'Delhi', 'M', 12, '2024-07-01', 20000, 3)

--47) Update the marks of a studentto a value greater than 100 and check whether the CHECK constraint blocks it.  
UPDATE Student SET Marks = 150 WHERE RollNo = 6

--48) Display all students whose marks are greater than 75.
select * from student where Marks > 75

--49) Display all students whose fee is less than or equal to 20,000.
select * from student where Fee <= 20000

--50) Display all students whose age is not equal to 18.
select * from student where Age != 18

--51) Display all students belonging to the 'Computer Science' course AND having marks greater than 60.
select * from student where course = 'Computer Science' and Marks > 60

--52) Display all students belonging to the 'Computer Science' course OR the 'Commerce' course.
select * from student where course = 'Computer Science' or Course = 'Commerce'

--53) Display all students whose marks are BETWEEN 50 and 90.
select * from student where Marks between 50 and 90

--54) Display all students whose fee is BETWEEN 10,000 and 30,000.
select * from student where Fee between 10000 and 30000

--55) Display all students whose city is IN ('Delhi', 'Jaipuri, 'Ahmedabad').
select * from student where City in ('Delhi', 'Jaipur', 'Ahmedabad')

--56) Display all students whose course is NOT IN ('Arts', 'Commerce').
select * from student where Course not in ('Arts', 'Commerce')

--57) Display all students whose name starts with the letter 'S' using the LIKE operator.
select * from student where StudentName like 'S%'

--58) Display all students whose name ends with the letter 'n' using the LIKE operator.
select * from student where StudentName like '%n'

--59) Display all students whose name contains the substring 'an' anywhere in it.
select * from student where StudentName like '%an%'

--60) Display all students whose gender is 'F' and marks are greater than 80.
select * from student where Gender = 'F' and Marks > 80

--61) Display all students whose department value IS NULL (if any).
select * from student where DepartmentID is NULL

--62) Display all students whose department value IS NOT NULL.
select * from student where DepartmentID is NOT NULL

--63) Find the total number of students using COUNT.
select Count(*) as TotalStudent from student 

--64) Find the total number of students who belong to the 'Computer Science' course.
select Count(*) as TotalStudent from student where Course = 'Computer Science'

--65) Find the total fee collected from all students using SUM.
select Sum(Fee) as TotalFee from student 

--66) Find the total fee collected from students of a specific course.
select Sum(Fee) as totalFee from student where Course = 'Computer Science'

--67) Find the average marks of all students using AVG.
select Avg(Marks) as AverageMarks from student 

--68) Find the average fee paid by students belonging to a specific city.
select Avg(Fee) as AverageFee from student where City = 'Pune'

--69) Find the highest marks scored by any student using MAX.
select Max(Marks) as HighestMarks from student

--70) Find the lowest marks scored by any student using MIN.
select Min(Marks) as LowestMarks from student

--71) Find the highest fee paid by any student.
select Max(Fee) as HighestFee from student

--72) Find the lowest fee paid by any student.
select Min(Fee) as LowestFee from student

--73) Find the average age of all students.
select Avg(Age) as AverageAge from student
 
--74) Find the total number of distinct courses offered, using COUNT with DISTINCT.
select count(distinct course) as DistinctCourse from student 

--75) Find the total number of distinct cities the students belong to.
select count(distinct city) as DistinctCities from student 

--76) Find the maximum age among all students.
select Max(Age) as MaxAge from student

--77) Find the minimum age among all students.
select Min(Age) as MinAge from student

--78) Find the sum of marks of all students combined.
select Sum(Marks) as TotalMarks from student

--79) Find the average marks of only the female students.
select Avg(Marks) as AvgFemaleMarks from student where Gender = 'F'

--80) Find the count of students who scored more than 90 marks.
select Count(*) as TopStudent from student where Marks > 90

--81) Display the total number of students in each course, using GROUP BY.
select Course, Count(*) as TotalStudent from student group by Course

--82) Display the average marks of students, grouped by course.
select Course, Avg(Marks) as AvgMarks from student group by Course

--83) Display the total fee collected, grouped by department.
select DepartmentID, Sum(Fee) as TotalFee from student group by DepartmentID 

--84) Display the maximum marks scored, grouped by city.
Select City, Max(Marks) as MaxMarks from student group by City

--85) Display the minimum age, grouped by gender.
select Gender, Min(Age) as MinAge from student group by Gender

--86) Display the count of students, grouped by city.
select City,Count(*) as TotalStudent from student group by City

--87) Display the average fee, grouped by course and city together.
select course, city, Avg(Fee) as AverageFee from Student group by course, city

--88) Display the sum of marks, grouped by department.
select DepartmentID, Sum(Marks) as TotalMarks from student group by DepartmentID

--89) Display courses having more than 5 students enrolled, using HAVING
select course, count(*) as TotalStudent from student group by course having count(*) > 5 

--90) Display cities having an average fee greater than 15,000, using HAVING.
select city, Avg(Fee) as AvgFee from student group by city having Avg(Fee) > 15000

--91) Display departments having a total student count greater than 3, using HAVING.
select DepartmentID, Count(*) as TotalStudent from student group by DepartmentID having Count(*) > 3

--92) Display courses having an average marks greater than 70, using HAVING.
select Course, Avg(Marks) as AvgMarks from student group by Course having Avg(Marks) > 70

--93) Display genders having a maximum marks value greater than 95, using HAVING.
select Gender, Max(Marks) as MaxMarks from student group by Gender having Max(Marks) > 95

--94) Display all student records sorted by marks in descending order, using ORDER BY.
select * from student order by Marks desc

--95) Display all student records sorted by fee in ascending order.
select * from student
order by Fee

--96) Display all student records sorted by course (ascending) and then marks (descending).
select * from student 
order by Course asc, Marks desc

--97) Display all student records sorted by admission date, showing the most recently admitted students first.
select * from student
order by AdmissionDate desc

--98) Display the top 10 students with the highest marks, using ORDER BY along with a row-limiting clause.
select top 10 * from student 
order by Marks desc

--99) Display all distinct courses sorted alphabetically.
select distinct course 
from student 
order by course asc

--100).Display department-wise student count sorted from highest to lowest count, combining GROUP BY and ORDER BY.
select DepartmentID, count(*) as TotalStudent 
from student
group by DepartmentID 
order by count(*) desc

