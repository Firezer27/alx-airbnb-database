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
select
  b.booking_id,
  b.property_id,
  b.user_id,
  u.first_name,
  u.last_name,
  b.start_date,
  b.end_date,
  b.status
from Booking as b
inner join
  User as u
on b.user_id = u.user_id;

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
