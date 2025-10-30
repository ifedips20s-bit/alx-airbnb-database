SELECT 
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    b.amount,
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.id;



SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    r.id AS review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM properties p
LEFT JOIN reviews r 
    ON p.id = r.property_id;



SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.id = b.user_id;


  

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
