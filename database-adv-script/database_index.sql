-- Before creating indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';

-- Create index
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);

-- After creating indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';

-- Indexes for Users
CREATE INDEX idx_users_id ON users(id);

-- Indexes for Bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);

-- Indexes for Properties
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Indexes for Reviews
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
