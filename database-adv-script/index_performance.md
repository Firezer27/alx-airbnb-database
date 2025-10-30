-- ==============================================================

-- 1. USER TABLE INDEXES

-- ==============================================================

CREATE INDEX idx_users_email on User(email);

CREATE INDEX idx_users_username on User(username);

-- ==============================================================

-- 2. PROPERTY TABLE INDEXES

-- ==============================================================

- CREATE INDEX idx_properties_user_id on property(user_id);

- CREATE INDEX idx_properties_city on property(city);

- CREATE INDEX idx_properties_price on property(price);


-- ==============================================================

-- 3. BOOKING TABLE INDEXES

-- ==============================================================

- CREATE INDEX idx_booking_user_id on Booking(user_id);

- CREATE INDEX idx_booking_property_id on Booking(property_id);

- CREATE INDEX idex_booking_date on Booking(booking_date):

-- ==============================================================

-- Measure a query perfomance

-- ==============================================================

- EXPLAIN SELECT * FROM Bookings WHERE user_id = 10;

- EXPLAIN SELECT * FROM Properties WHERE city = 'Addis Ababa';

- EXPLAIN SELECT * FROM Users WHERE email = 'firezer@example.com';






