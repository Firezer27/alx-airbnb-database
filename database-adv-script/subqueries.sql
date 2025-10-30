-- ==============================================================
-- 1. Non-Correlated Subquery
-- Objective:
--   Find all properties where the average rating is greater than 4.0
-- ==============================================================
SELECT * 
FROM
  Property AS p
WHERE
  p.property_id IN (
      SELECT
         r.property_id
      FROM 
         Review AS r
      GROUP BY
         r.property_id
      HAVING
         AVG(r.rating) > 4.0
  ) ;

-- ==============================================================
-- 2. Correlated Subquery
-- Objective:
--   Find users who have made more than 3 bookings.
-- ==============================================================
SELECT * 
FROM
  USER AS u
  WHERE(
    SELECT
       COUNT(*)
    FROM 
       Booking AS b
    WHERE 
       b.user_id = u.user_id
  )>3;


