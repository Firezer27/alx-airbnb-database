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
