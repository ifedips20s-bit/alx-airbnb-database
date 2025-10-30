-- Create main partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL
) PARTITION BY RANGE (check_in_date);

-- Create partitions for each year
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

CREATE TABLE bookings_2027 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2027-01-01') TO ('2028-01-01');


INSERT INTO bookings_partitioned (id, user_id, property_id, check_in_date, check_out_date, amount)
SELECT id, user_id, property_id, check_in_date, check_out_date, amount
FROM bookings;


-- Fetch bookings for a specific year
SELECT *
FROM bookings_partitioned
WHERE check_in_date BETWEEN '2025-06-01' AND '2025-06-30';

-- Performance check
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE check_in_date BETWEEN '2025-06-01' AND '2025-06-30';


