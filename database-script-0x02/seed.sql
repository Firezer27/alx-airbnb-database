-- Airbnb Clone Database Seeding Script
-- Author: Firezer Bizuwork
-- Project: alx-airbnb-database
-- Objective: Insert sample data into all tables for testing

-- ============================================
-- USERS
-- ============================================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+251900000001', 'host'),
('22222222-2222-2222-2222-222222222222', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+251900000002', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password_3', '+251900000003', 'host'),
('44444444-4444-4444-4444-444444444444', 'Sara', 'Johnson', 'sara.johnson@example.com', 'hashed_password_4', '+251900000004', 'guest'),
('55555555-5555-5555-5555-555555555555', 'Admin', 'User', 'admin@airbnbclone.com', 'hashed_password_5', '+251900000005', 'admin');

-- ============================================
-- PROPERTIES
-- ============================================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Cozy Apartment in Addis Ababa', 'A lovely 2-bedroom apartment near Bole.', 'Addis Ababa, Ethiopia', 45.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'Luxury Villa in Bishoftu', 'A private villa with lake view and pool.', 'Bishoftu, Ethiopia', 150.00),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '11111111-1111-1111-1111-111111111111', 'Downtown Condo', 'Modern condo near city center.', 'Addis Ababa, Ethiopia', 65.00);

-- ============================================
-- BOOKINGS
-- ============================================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-11-01', '2025-11-05', 180.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2025-12-10', '2025-12-15', 750.00, 'pending'),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '22222222-2222-2222-2222-222222222222', '2025-11-15', '2025-11-18', 195.00, 'canceled');

-- ============================================
-- PAYMENTS
-- ============================================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 180.00, 'credit_card'),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 750.00, 'paypal');

-- ============================================
-- REVIEWS
-- ============================================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing apartment and friendly host!'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 4, 'Beautiful view, but the Wi-Fi could be better.');

-- ============================================
-- MESSAGES
-- ============================================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi John, I’m interested in booking your apartment next week.'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Jane, sure! It’s available from November 1st.');

-- ============================================
-- END OF SEED DATA
-- ============================================
