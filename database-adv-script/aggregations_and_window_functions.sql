-- ==============================================================
-- 1. Aggregation Query: Count total bookings made by each user
-- ==============================================================
select
  u.user_id,
  u.first_name,
  u.last_name, 
  count(b.booking_id) as total_bookings
from 
  users as u
left join
  Booking as b
on 
  u.user_id = b.user_id
group by 
  u.user_id
order by
  total_bookings desc;


-- ==============================================================
-- 2. Window Function Query: Rank properties by total bookings
-- ==============================================================
select
  p.property_id,
  p.name,
  count(b.booking_id) as total_bookings,
  rank() over( order by count(b.booking_id) desc) as booking_rank
from 
  Property as p
left join
  Booking as b
on 
  p.property_id=b.property_id
group by 
  p.property_id,p.name
order by
  booking_rank
