For the Airbnb schema, common high-usage columns include:

| Table      | Column          | Reason                                      |
|------------|----------------|---------------------------------------------|
| users      | id             | Primary key, used in JOINs                  |
| bookings   | user_id        | Used in JOIN with users                      |
| bookings   | property_id    | Used in JOIN with properties                 |
| bookings   | check_in_date  | Often filtered in queries for date ranges   |
| properties | id             | Primary key, used in JOINs                  |
| properties | host_id        | Used for queries per host                    |
| reviews    | property_id    | Used in JOIN with properties                 |
| reviews    | user_id        | Used in JOIN with users                      |


-- Before indexing
EXPLAIN SELECT * 
FROM bookings b 
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';

-- After indexing
EXPLAIN SELECT * 
FROM bookings b 
JOIN users u ON b.user_id = u.id
WHERE b.check_in_date >= '2025-01-01';
