-- =========================
-- SEED DATA FOR AIRBNB DB
-- =========================

-- Insert Users
INSERT INTO users (id, name, email, password, created_at) VALUES
(1, 'John Doe', 'john@example.com', 'hashed_password_1', NOW()),
(2, 'Jane Smith', 'jane@example.com', 'hashed_password_2', NOW()),
(3, 'Michael Brown', 'michael@example.com', 'hashed_password_3', NOW());

-- Insert Properties
INSERT INTO properties (id, owner_id, title, description, address, price_per_night, created_at) VALUES
(1, 1, 'Lakeview Cottage', 'A cozy cottage with lake view', '12 Lake Road, Ontario', 120.00, NOW()),
(2, 2, 'Urban Studio Apartment', 'Modern studio in the city center', '88 Downtown St, New York', 90.00, NOW()),
(3, 1, 'Beachfront Villa', 'Spacious villa facing the ocean', '5 Sunset Blvd, Miami', 350.00, NOW());

-- Insert Bookings
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, total_price, status, created_at) VALUES
(1, 2, 1, '2025-01-10', '2025-01-13', 360.00, 'confirmed', NOW()),
(2, 3, 2, '2025-02-01', '2025-02-05', 360.00, 'pending', NOW()),
(3, 2, 3, '2025-03-20', '2025-03-22', 700.00, 'confirmed', NOW());

-- Insert Payments
INSERT INTO payments (id, booking_id, amount, payment_date, method, status) VALUES
(1, 1, 360.00, '2025-01-09', 'credit_card', 'successful'),
(2, 3, 700.00, '2025-03-18', 'bank_transfer', 'successful');
