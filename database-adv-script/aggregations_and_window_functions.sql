-- ==============================================================
-- 1. Aggregation Query: Count total bookings made by each user
-- ==============================================================
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Properties AS p
LEFT JOIN 
    Bookings AS b
ON 
    p.property_id = b.property_id
GROUP BY 
    p.property_id, p.title
ORDER BY 
    total_bookings DESC;


-- ==============================================================
-- 2. Window Function Query: Rank properties by total bookings
-- ==============================================================
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
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
