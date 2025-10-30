# Airbnb Database Project

This project is part of the ALX Airbnb Database Module. It demonstrates advanced SQL querying techniques including joins, subqueries, aggregations, and window functions.

---

## 1. Write Complex Queries with Joins

**Objective:** Master SQL joins by writing complex queries using different types of joins.

### Queries:

**a) INNER JOIN – Retrieve all bookings and their respective users**

```sql
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


Objective: Write both correlated and non-correlated subqueries.

Queries:

a) Non-Correlated Subquery – Properties with Average Rating > 4.0

SELECT *
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


b) Correlated Subquery – Users with More Than 3 Bookings
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;


Apply Aggregations and Window Functions

Objective: Use SQL aggregation and window functions to analyze data.

Queries:

a) Total Bookings Per User

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b 
    ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

b) Rank Properties by Total Bookings Using Window Function

SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS property_rank
FROM properties p
LEFT JOIN bookings b 
    ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY property_rank;


