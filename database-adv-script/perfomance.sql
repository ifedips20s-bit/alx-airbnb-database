EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.amount AS booking_amount,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price AS property_price,
    pay.id AS payment_id,
    pay.amount_paid,
    pay.payment_date,
    pay.status AS payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
WHERE b.check_in_date >= '2025-01-01'
  AND pay.status = 'Completed';