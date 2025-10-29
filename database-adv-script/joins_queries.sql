-- ==============================================================
-- FILE: joins_queries.sql
-- PROJECT: ALX Airbnb Database
-- AUTHOR: Firezer Bizuwork
-- DESCRIPTION:
--   This script demonstrates SQL JOIN operations:
--     1. INNER JOIN
--     2. LEFT JOIN
--     3. FULL OUTER JOIN
-- ==============================================================


-- ==============================================================
-- 1. INNER JOIN
-- ==============================================================
select * from Booking
inner join User
on Booking.user_id = User.user_id;

-- ==============================================================
-- 2. LEFT JOIN
-- ==============================================================
select * from Property
left join Review 
on Property.property_id = Review.property_id;

-- ==============================================================
-- 3. FULL OUTER JOIN
-- ==============================================================
select * from User
full outer join Booking
on  User.user_id = Booking.user_id;
