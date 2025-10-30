-- ==============================================================
-- 1. Aggregation Query: Count total bookings made by each user
-- ==============================================================
SELECT
  u.user_id,
  u.first_name,
  u.last_name, 
  COUNT(b.booking_id) AS total_bookings
FROM
  users AS u
LEFT JOIN
  Booking AS b
ON 
  u.user_id = b.user_id
GROUP BY 
  u.user_id
ORDER BY
  total_bookings DESC;


-- ==============================================================
-- 2. Window Function Query: Rank properties by total bookings
-- ==============================================================
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  rank() over( ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM
  Property AS p
LEFT JOIN
  Booking AS b
ON
  p.property_id=b.property_id
GROUP BY 
  p.property_id,p.name
ORDER BY
  booking_rank
