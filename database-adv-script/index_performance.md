-- ==============================================================
-- 1. USER TABLE INDEXES
-- ==============================================================

create index idx_users_email on User(email);

create index idx_users_username on User(username);

-- ==============================================================
-- 2. PROPERTY TABLE INDEXES
-- ==============================================================

- create index idx_properties_user_id on property(user_id);

- create index idx_properties_city on property(city);

- create index idx_properties_price on property(price);


-- ==============================================================
-- 3. BOOKING TABLE INDEXES
-- ==============================================================

- create index idx_booking_user_id on Booking(user_id);

- create index idx_booking_property_id on Booking(property_id);

- create index idex_booking_date on Booking(booking_date):



