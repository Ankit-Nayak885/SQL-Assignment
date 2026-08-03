create table trains (train_id int primary key, train_name varchar(50) not null, source varchar(50) not null, 
destination varchar(50) not null, departure_time time not null, 
arrival_time time not null, distance_km int not null check(distance_km > 0))

create table passengers (passenger_id int primary key, name varchar(50) not null, 
age int check(age > 0), gender char(1) check(gender in ('M','F')), city varchar(50))

create table reservations (res_id int primary key, passenger_id int, train_id int, 
travel_date date not null, class varchar(20) check(class in ('Sleeper', 'AC1', 'AC2', 'AC3')), 
fare decimal(10,2) check(fare >= 0), status varchar(20) check(status in ('Confirmed', 'Waiting', 'Cancelled'))
foreign key (passenger_id) references passengers (passenger_id),
foreign key (train_id) references trains (train_id))


INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500)


INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum')


INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled')


select * from trains
select * from passengers
select * from reservations


--1)List all trains running from Delhi as source station.
select train_name from trains where source = 'Delhi'

--2)Find all passengers who are above 40 years of age.
select name from passengers where age > 40

--3)Get the total number of reservations made.
select count(res_id) as TotalReservations from reservations

--4)Count how many reservations are in 'Confirmed' status.
select count(res_id) as ConfirmedReservations from reservations where status = 'Confirmed'

--5)Show the average fare paid for each train.
select train_id, Avg(fare) as AverageFare from reservations group by train_id

--6)List reservations ordered by fare in descending order.
select * from reservations order by fare desc

--7)Find passengers who booked AC classes (AC2, AC3)
select name, class from passengers p inner join reservations r 
on p.passenger_id = r.passenger_id where class in ('AC2','AC3')

--8)Get total revenue collected per train (only Confirmed reservations).
select train_id, Sum(fare) as TotalRevenue from reservations where status = 'Confirmed' group by train_id

--9)Find the train with the maximum distance_km.
select * from trains where distance_km = (select Max(distance_km) from trains)

--10)Show number of male and female passengers.
select gender, count(*) as Total from passengers group by gender

--11)Get the passenger names who have booked tickets in Sleeper class.
select name, class from passengers inner join reservations on passengers.passenger_id = reservations.passenger_id 
where class = 'Sleeper'

--12)Find total number of reservations made from each city (JOIN with Passengers).
select city, count(res_id) as TotalRes from passengers p inner join reservations r 
on p.passenger_id = r.passenger_id group by city

--13)Show train name and total passengers booked for it, ordered by passenger count descending.
select train_name, count(passenger_id) as TotalBooked from trains t inner join reservations r
on t.train_id = r.train_id group by train_name order by TotalBooked desc

--14)Find the average age of passengers who booked 'Confirmed' tickets.
select Avg(age) as AverageAge from passengers p inner join reservations r on p.passenger_id = r.passenger_id
where r.status = 'Confirmed'

--15)Display travel_date and number of reservations made on that date.
select travel_date, count(*) as TotalRes from reservations group by travel_date

--16)Show all reservations where fare is greater than 1000.
select * from reservations where fare > 1000

--17)List all passengers who live in Delhi or Mumbai.
select * from passengers where city in ('Delhi','Mumbai')

--18)Show all trains whose distance is more than 1200 km.
select * from trains where distance_km > 1200

--19)Find reservations which are not "Cancelled".
select * from reservations where status != 'Cancelled'

--20)Show the details of trains that have "Exp" in their name.
select * from trains where train_name like '%Exp%'

--21)List all passengers ordered by their age in descending order.
select * from passengers order by age desc

--22)Display reservations sorted by travel_date (earliest first).
select * from reservations order by travel_date asc

--23)Find all trains ordered by distance (longest route first).
select * from trains order by distance_km desc

--24)Show passengers ordered by name alphabetically.
select * from passengers order by name asc

--25)List reservations ordered by class and then by fare.
select * from reservations order by class, fare 

--26)Count how many passengers are from each city.
select city, count(*) as TotalPassenger from passengers group by city 

--27)Find the total fare collected from all Confirmed reservations.
select Sum(fare) as TotalFare from reservations where status = 'Confirmed'

--28)Show the minimum, maximum, and average age of passengers.
select Min(age) as MinAge, Max(age) as MaxAge, Avg(age) as AvgAge from passengers

--29)Find the highest fare paid in Sleeper class.
select Max(fare) as HighestFare from reservations where class = 'Sleeper'

--30)Get the average fare per travel_date.
select travel_date, Avg(fare) as AvgFare from reservations group by travel_date

--31)Show each class and the total number of reservations in it.
select class, count(*) as TotalNumber from reservations group by class

--32)Find trains that have more than 1 reservatiom
select train_id, count(*) as Total from reservations group by train_id having count(*) > 1

--33)List cities where more than 1 passenger lives.
select city, count(*) as Total from passengers group by city having count(*) > 1

--34)Show gender-wise average age of passengers.
select gender, Avg(age) as AvgAge from passengers group by gender

--35)Find passengers who booked more than 1 ticket.
select passenger_id, count(*) as Total from reservations group by passenger_id having count(*) > 1

--36)Show passenger name, train name, and fare for each reservation.
select name, train_name, fare from reservations r inner join passengers p 
on r.passenger_id = p.passenger_id inner join trains t on r.train_id = t.train_id

--37)List all passengers and the train name they booked (if any).
select name, train_name from passengers p left join reservations r on p.passenger_id = r.passenger_id
										  left join trains t on r.train_id = t.train_id

--38)Show all trains and the number of passengers booked in each.
select train_name, count(res_id) as Total from trains t left join reservations r 
on t.train_id = r.train_id group by train_name

--39)Find all passengers who booked Rajdhani Exp.
select p.* from passengers p inner join reservations r on p.passenger_id = r.passenger_id
							 inner join trains t on r.train_id = t.train_id
							 where t.train_name = 'Rajdhani Exp'

--40)List passenger names with their travel_date and status.
select name, travel_date, status from passengers p inner join reservations r on p.passenger_id = r.passenger_id

--41)Find the top 2 highest fare reservations.
select top 2 * from reservations order by fare desc

--42)Find the train with the lowest average fare.
select top 1 train_id, Avg(fare) as MinAvgFare from reservations group by train_id order by Avg(fare) asc 

--43)Show the train(s) where total distance travelled by all passengers > 1000 km.
select t.train_id, t.train_name, Sum(distance_km) as TotalDistance from trains t inner join reservations r
on t.train_id = r.train_id group by t.train_id, t.train_name having Sum(distance_km) > 1000

--44)Find passengers whose reservation status is 'Waiting".
select * from passengers p inner join reservations r on p.passenger_id = r.passenger_id where status = 'Waiting'

--45)Show the passenger(s) who paid the maximum fare overall.
select p.* from passengers p inner join reservations r on p.passenger_id = r.passenger_id
where r.fare = (select Max(fare) from reservations)

--46)Show all passengers whose age is between 20 and 40.
select * from passengers where age between 20 and 40

--47)Find trains that start from Kolkata or Chennai.
select * from trains where source in ('Kolkata' , 'Chennai')

--48)Show all reservations made after 2025-09-05
select * from reservations where travel_date > '2025-09-05'

--49)Display passengers whose name starts with 'A'
select * from passengers where name like 'A%'

--50)List passengers whose city is NOT Delhi.
select * from passengers where city != 'Delhi'

--51)Show the 3 youngest passengers.
select top 3 passenger_id, name, age from passengers order by age asc

--52)Show the 2 longest-distance trains.
select top 2 * from trains order by distance_km desc

--53)Display the 5 most expensive reservations (highest fare).
select top 5 * from reservations order by fare desc

--54)List trains in alphabetical order of train_name.
select * from trains order by train_name asc

--55)Show passengers sorted by age (youngest first).
select * from passengers order by age asc

--56)Find the average fare of all reservations.
select Avg(fare) as AvgFare from reservations

--57)Count the total number of male passengers.
select count(*) as TotalMale from passengers where gender = 'M' 

--58)Show the maximum distance among all trains.
select Max(distance_km) as MaxDis from trains 
 
--59)Find the total number of Sleeper class reservations.
select count(*) as Total from reservations where class = 'Sleeper'

--60)Find the total fare paid by passengers from Mumbai.
select Sum(fare) as TotalFare from reservations r inner join passengers p on r.passenger_id = p.passenger_id
where city = 'Mumbai'

--61)Count the number of reservations per status (Confirmed/Waiting/Cancelled).
select status, count(*) as Total from reservations group by status

--62)Find the total number of passengers per gender.
select gender, count(*) as Total from passengers group by gender

--63)Show the average fare for each class.
select Avg(fare) as AvgFare, class from reservations group by class 

--64)Display the number of trains starting from each source city.
select source, count(*) as TotalNumber from trains group by source

--65)Show total reservations grouped by travel_date.
select travel_date, count(*) as TotalRes from reservations group by travel_date

--66)Show passenger name, city. and train_name they booked.
select name, city, train_name from passengers p inner join reservations r on p.passenger_id = r.passenger_id
												inner join trains t on r.train_id = t.train_id

--67)List all reservations with passenger name and status.
select r.*, name, status from passengers p inner join reservations r on p.passenger_id = r.passenger_id

--68)Show train_name and number of confirmed passengers on it.
select train_name, count(*) as Confirmed from trains t inner join reservations r on t.train_id = r.train_id
where status = 'Confirmed' group by train_name

--69)Display all passengers with train_name (if booked, else show NULL).
select p.*, train_name from passengers p left join reservations r on p.passenger_id = r.passenger_id
										 left join trains t on r.train_id = t.train_id

--70)Find which passengers booked Garib Rath train
select * from passengers p inner join reservations r on p.passenger_id = r.passenger_id
						   inner join trains t on r.train_id = t.train_id
						   where t.train_name = 'Garib Rath'

--71)Show train_id and total fare collected, but only where fare > 1000.
select train_id, Sum(fare) as TotalFare from reservations group by train_id having Sum(fare) > 1000

--72)List source cities that have more than 1 train.
select source, count(*) as Total from trains group by source having count(*) > 1 

--73)Find passengers grouped by city where count > 1.
select city, count(*) as Total from passengers group by city having count(*) > 1

--74)Show classes that earned more than 2000 fare in total
select class, Sum(fare) as Total from reservations group by class having Sum(fare) > 2000

--75)List trains that have at least 2 passengers booked.
select train_id, count(*) as total from reservations group by train_id having count(*) >= 2

--76)Find the passenger(s) with the highest age.
select * from passengers where age = (select Max(age) from passengers)

--77)Show the train(s) with the shortest distance.
select * from trains where distance_km = (select Min(distance_km) from trains)

--78)Find the reservation(s) with the lowest fare.
select * from reservations where fare = (select Min(fare) from reservations)

--79)List passengers who paid above the average fare.
select p.* from passengers p inner join reservations r on p.passenger_id = r.passenger_id 
where r.fare > (select Avg(fare) from reservations)

--80)Find trains whose distance is above the average train distance.
select * from trains where distance_km > (select Avg(distance_km) from trains)

--81)Show all reservations in September 2025.
select * from reservations where travel_date between '2025-09-01' and '2025-09-30'

--82)Find the earliest travel_date booked.
select Min(travel_date) as Earliest from reservations

--83)Find the latest travel_date booked.
select Max(travel_date) as Latest from reservations

--84)Count how many reservations are made per day.
select travel_date, count(*) as TotalRes from reservations group by travel_date

--85)List passengers who booked tickets on the same date.
select passenger_id, travel_date, count(*) as Total from reservations
group by travel_date having count(*) > 1

--86)Show passenger name, train_name, and distance travelled.
select name, train_name, distance_km from passengers p inner join reservations r on p.passenger_id = r.passenger_id
													   inner join trains t on r.train_id = t.train_id

--87)Find the city that contributed the highest number of passengers.
select top 1 city, count(*) as Total from passengers group by city order by Total desc

--88)Display each train and its average fare (confirmed only).
select t.train_name, Avg(fare) from trains t inner join reservations r on t.train_id = r.train_id
where r.status = 'Confirmed' group by t.train_name 

--89)Show passengers who booked tickets in more than one class.
select passenger_id, count(distinct class) as ClassCount from reservations group by passenger_id 
having count(distinct class) > 1

--90)Find train_name with maximum number of reservations.
select top 1 train_name, count(res_id) as TotalRes from trains t inner join reservations r  
on t.train_id = r.train_id group by train_name order by count(res_id) desc