EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    u.name AS user_name,
    p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.check_in_date BETWEEN '2025-06-01' AND '2025-06-30';


CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);


EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';


EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';




