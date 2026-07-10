create database ola;
use ola;
select * from bookings;

create view Successful_Bookings AS
select * FROM Bookings
WHERE booking_status = 'success';

create view ride_distance_for_each_vehicle AS
select vehicle_type,
AVG(Ride_Distance) 
AS avg_distance from Bookings
group by vehicle_type;

create view cancelled_rides_by_customers AS
select count(*) from bookings
where booking_status = 'Canceled by customer';

create view top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';