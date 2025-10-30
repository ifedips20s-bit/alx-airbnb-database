EXPLAIN SELECT 
    b.id, b.check_in_date, b.check_out_date, b.amount,
    u.id, u.name, u.email,
    p.id, p.name, p.location, p.price,
    pay.id, pay.amount_paid, pay.payment_date, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;


SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount_paid,
    pay.status AS payment_status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON pay.booking_id = b.id;
