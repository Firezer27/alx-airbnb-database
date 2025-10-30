-- ==============================================================
-- 1. Non-Correlated Subquery
-- Objective:
--   Find all properties where the average rating is greater than 4.0
-- ==============================================================
Select * 
from
  Property As p
where
  p.property_id In (
      Select
         r.property_id
      from 
         Review As r
      group by
         r.property_id
      having
         AVG(r.rating) > 4.0
  ) ;

-- ==============================================================
-- 2. Correlated Subquery
-- Objective:
--   Find users who have made more than 3 bookings.
-- ==============================================================
select * 
from 
  User as u
  where(
    select
       count(*)
    from 
       Booking as b
    where 
       b.user_id = u.user_id
  )>3;


