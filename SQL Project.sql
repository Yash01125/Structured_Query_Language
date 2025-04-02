create database Project;
use project;

select * from project;

-- 1) all completed bookings
SELECT Date,Booking_Status,Vehicle_Type,Pickup_Location,Drop_Location,Payment_Method FROM project;
select * from project where Booking_Status= "Success";

-- 2) Count total bookings with vehicle type
SELECT Vehicle_Type,COUNT(*) AS Total_Bookings
FROM project
GROUP BY Vehicle_Type;

-- 3) average ride distance with vehicle type
SELECT Vehicle_Type,AVG(Ride_Distance) AS Avg_Distance
FROM project
GROUP BY Vehicle_Type;

-- 4) most pickup location
SELECT Pickup_Location,COUNT(*) AS Total_Pickups
FROM project
GROUP BY Pickup_Location
ORDER BY Total_Pickups DESC
LIMIT 1;

-- 5) all bookings with rating under 3
SELECT * FROM project
WHERE Driver_Ratings < 3 OR Customer_Rating < 3;

-- 6) total revenue 
SELECT SUM(Booking_Value) AS Total_Revenue
FROM project;

-- 7) number of cancellations by customers and drivers
SELECT 
COUNT(Canceled_Rides_by_Customer) AS Canceled_By_Customer,
COUNT(Canceled_Rides_by_Driver) AS Canceled_By_Driver
FROM project;

-- 8) top 5 customers who booked the most rides 
SELECT Customer_ID,COUNT(*) AS Total_Bookings
FROM project
GROUP BY Customer_ID
ORDER BY Total_Bookings DESC
LIMIT 5;

-- 9) most common reason for incomplete rides
SELECT Incomplete_Rides_Reason,COUNT(*) AS Occurrences
FROM project
WHERE Incomplete_Rides_Reason IS NOT NULL
GROUP BY Incomplete_Rides_Reason
ORDER BY Occurrences DESC
LIMIT 5;

-- 10) average booking value with payment method
SELECT Payment_Method, AVG(Booking_Value) AS Avg_Booking_Value
FROM project
WHERE Payment_Method IS NOT NULL
GROUP BY Payment_Method;

-- INSIGHTS

-- Completed Bookings
-- A higher number of completed bookings suggests better operational efficiency.

-- Count total bookings with vehicle type
-- If bikes are in high demand, it suggests people prefer quick, affordable rides.
-- If SUVs or sedans are in high demand, it indicates customers prefer comfort over price.

-- average ride distance with vehicle type
-- Longer ride distances for SUVs or sedans may suggest customers use them for long-distance trips.
-- Shorter distances for bikes/eBikes could mean they are used for quick, last-mile travel.

-- most pickup location
-- Peak-time analysis can further refine demand patterns.

-- all bookings with rating under 3
-- If customer ratings are low, drivers may need better training or service guidelines.

-- total revenue
-- Gives an overall estimate of earnings from completed bookings.
-- Helps track revenue trends over time and compare against operational costs.
-- If revenue is lower than expected, pricing strategies may need revision.

-- number of cancellations by customers and drivers
-- High customer cancellations might mean long wait times, unreliable service, or pricing issues.

-- top 5 customers who booked the most rides
-- Identifies loyal customers who frequently use the service.

-- most common reason for incomplete rides
-- If "Driver is not moving towards pickup location" is a common issue, better driver compliance tracking is needed.

-- average booking value with payment method
-- Helps understand customer payment preferences.
-- If UPI/digital payments dominate, the service should focus on cashless promotions.
-- If cash is still widely used, some customers may prefer offline transactions, and driver cash handling policies should be optimized.