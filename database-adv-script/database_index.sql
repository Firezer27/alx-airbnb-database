
-- ==============================================================
-- 1. CREATE INDEXES ON HIGH-USAGE COLUMNS
-- ==============================================================

-- Index for quick search by email (used in WHERE clauses)
CREATE INDEX idx_users_email ON Users(email);

-- Index for faster join between Bookings and Users
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index for faster join between Bookings and Properties
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index for location-based property search
CREATE INDEX idx_properties_location ON Properties(location);

-- Index for sorting by property price
CREATE INDEX idx_properties_price ON Properties(price_per_night);



-- ==============================================================
-- 2. MEASURE QUERY PERFORMANCE BEFORE AND AFTER INDEXING
-- ==============================================================

-- Use EXPLAIN ANALYZE to view actual query execution times

-- Before indexes (you can comment this section if indexes already exist)
-- EXPLAIN ANALYZE SELECT * FROM Users WHERE email = 'firezer@example.com';

-- After creating indexes — measure improvements
EXPLAIN ANALYZE SELECT * FROM Users WHERE email = 'firezer@example.com';

EXPLAIN ANALYZE 
SELECT p.name, b.start_date, b.end_date, u.first_name, u.last_name
FROM Bookings AS b
JOIN Users AS u ON b.user_id = u.user_id
JOIN Properties AS p ON b.property_id = p.property_id
WHERE p.location = 'Addis Ababa'
ORDER BY p.price_per_night ASC;


-- ==============================================================
-- 3. OPTIONAL TEST QUERIES (to see results)
-- ==============================================================

-- Query 1: Search property by location and price
SELECT name, location, price_per_night
FROM Properties
WHERE location = 'Addis Ababa'
ORDER BY price_per_night ASC;

-- Query 2: List bookings with user and property details
SELECT u.first_name, u.last_name, p.name, b.start_date, b.status
FROM Bookings AS b
JOIN Users AS u ON b.user_id = u.user_id
JOIN Properties AS p ON b.property_id = p.property_id;


-- ==============================================================
-- END OF FILE
-- ==============================================================



