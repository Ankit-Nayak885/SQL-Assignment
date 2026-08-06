create table Product
(PID int,Pname varchar(20),City varchar(20),Quantity int,SalesUnit int)

insert into product values
(101, 'Laptop', 'Mumbai', 25, 5),
(102, 'Mouse', 'Delhi', 80, 20),
(103, 'Keyboard', 'Ahmedabad', 50, 15),
(104, 'Monitor', 'Pune', 30, 8),
(105, 'Printer', 'Jaipur', 18, 4),
(106, 'Scanner', 'Surat', 22, 6),
(107, 'Webcam', 'Vadodara', 45, 12),
(108, 'Speaker', 'Indore', 35, 10),
(109, 'Hard Disk', 'Bengaluru', 40, 9),
(110, 'Pendrive', 'Hyderabad', 100, 30),
(111, 'Laptop', 'Mumbai', 15, 3),
(112, 'Mouse', 'Mumbai', 60, 18),
(113, 'Keyboard', 'Delhi', 40, 10),
(114, 'Monitor', 'Mumbai', 20, 7),
(115, 'Printer', 'Delhi', 25, 5),
(116, 'SmartPhone', 'Kota', 14, 14),
(117,'Printer','Mumbai',0,0)

select *from Product

--(Single Value Subqueries) Subquery 

--1. Find all products that have a Quantity greater than the average quantity of all products. 
SELECT *FROM Product
WHERE Quantity > (
SELECT AVG(Quantity)FROM Product) 

--2. Display the ProductName of products sold in the same city as 'Laptop'. 
select Pname from Product
where city in (select City from Product
where Pname='Laptop')

--3. Find the details of the products with the maximum Quantity. 
select *
from Product
where Quantity = (select max(Quantity) 
from Product)

--4. List products whose salesUnit is higher than the salesUnit of ProductID 5. 
select * 
from product
where Salesunit>(
select Salesunit 
from product
where PID=105)

--5. Find products that have a lower Quantity than the minimum Quantity found in 'Vadodara'. 
select *
from Product
where Quantity< (
select min(Quantity) 
from Product
where City='Vadodara')

--6. Display products whose salesUnit is greater than the average salesUnit of products in 'Mumbai'. 
select *
from Product
where Salesunit > (
select avg(Salesunit) 
from Product
where City= 'Mumbai')

--7. Find the product name with the lowest salesUnit. 
select Pname,Salesunit as lowest_Salesunit
from Product
where SalesUnit = (
select min(Salesunit)
from Product)

--8. List all products sold in cities that have more than 50 total Quantity across all their products.
select City,Pname,Quantity
from Product
where City in (
select City from Product
group by City
having sum(Quantity)>50)

--9. Show products whose Quantity is exactly equal to the salesUnit of 'Smartphone'. 
select * 
from Product
where Quantity = (
select Salesunit 
from Product
where Pname='Smartphone')

--10. Find the city which has the product with the highest salesUnit. 
select City,Pname,Salesunit as Highest_Salesunit
from Product
where salesUnit=
(select max(salesunit) 
from Product)

--(IN, ALL, ANY & Correlated) 

--11. Find all products sold in cities where at least one product has a Quantity of zero. 
select * 
from Product
where City in (
select City
from Product
where Quantity=0)

-- 12. List products whose salesUnit is greater than the salesUnit of all products in 'Surat'. 
select * 
from Product
where SalesUnit > (
select SalesUnit 
from Product
where City = 'Surat')

-- 13. Find products that belong to cities where the average salesUnit is greater than 10. 
select * 
from Product
where City in (
select City
from Product
group by City
having avg(SalesUnit) > 10)

-- 14. Display products that have a Quantity greater than any product's Quantity in 'Pune'. 
select *from product
where Quantity > any 
(select Quantity from Product
where City='Pune')

--15. Find all products whose ProductName is the same as any product sold in 'Ahmedabad'. 
select *from Product
where Pname = any
(select Pname from Product 
where City='Ahemadabad')

--16. Select products where the Quantity is greater than the average Quantity of their own city. 
select *
from Product p1
where Quantity > (
select avg(Quantity)
from Product p2
where p1.City = p2.City)

--17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'. 
select City from Product 
group by City
having sum(salesunit) > 
(select sum(salesunit) from Product
where city='Vadodara')

--18. List products that are sold in the city that has the maximum variety (count) of products. 
select * from Product
where City=
(select top 1 City from Product
group by City
order by count(*) desc)

--19. Find the second highest Quantity from the Product table using a subquery. 
select MAX(Quantity) AS SecondHighestQuantity
from Product
where Quantity < (
select MAX(Quantity)
from Product)

--20. Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.
select Pname,Quantity,Quantity  - 
(select avg(Quantity)  from Product ) as Difference
from Product
