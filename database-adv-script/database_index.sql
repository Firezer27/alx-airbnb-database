
-- ==============================================================
-- 1. CREATE INDEXES ON HIGH-USAGE COLUMNS
-- ==============================================================

-- Index on Users table for quick search by email (used in login/authentication)
CREATE INDEX idx_users_email ON Users(email);

-- Index on Bookings table for faster lookup by user_id (used in joins)
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index on Bookings table for faster lookup by property_id (used in joins)
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index on Properties table for faster location-based search
CREATE INDEX idx_properties_location ON Properties(location);

-- Index on Properties table for sorting properties by price
CREATE INDEX idx_properties_price ON Properties(price_per_night);


-- ==============================================================
-- 2. MEASURE QUERY PERFORMANCE BEFORE AND AFTER INDEXING
-- ==============================================================

-- Before creating indexes:
-- Use EXPLAIN to see query plan and performance cost.

EXPLAIN SELECT * FROM Users WHERE email = 'firezer@example.com';

EXPLAIN 
SELECT p.name, b.booking_date, u.first_name
FROM Bookings AS b
JOIN Users AS u ON b.user_id = u.user_id
JOIN Properties AS p ON b.property_id = p.property_id
WHERE p.location = 'Addis Ababa'
ORDER BY p.price_per_night ASC;

-- After creating indexes:
-- Re-run EXPLAIN to confirm that the query optimizer now uses the indexes.

EXPLAIN SELECT * FROM Users WHERE email = 'firezer@example.com';

EXPLAIN 
SELECT p.name, b.booking_date, u.first_name
FROM Bookings AS b
JOIN Users AS u ON b.user_id = u.user_id
JOIN Properties AS p ON b.property_id = p.property_id
WHERE p.location = 'Addis Ababa'
ORDER BY p.price_per_night ASC;

-- ==============================================================
-- END OF FILE
-- ==============================================================


