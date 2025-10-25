# Entity Relationship Diagram (ERD) — Airbnb Database

## 1. Overview
This document describes the entities and relationships for the Airbnb database system. It includes the list of entities, their attributes, and how they relate to one another in the system.

The ERD visually represents how users, properties, bookings, payments, reviews, and messages interact in the platform.

---

## 2. Entities and Attributes

### **User**
- `user_id` (PK, UUID)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **Property**
- `property_id` (PK, UUID)
- `host_id` (FK → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `price_per_night` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

### **Booking**
- `booking_id` (PK, UUID)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **Payment**
- `payment_id` (PK, UUID)
- `booking_id` (FK → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

---

### **Review**
- `review_id` (PK, UUID)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `rating` (INTEGER, CHECK rating BETWEEN 1 AND 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **Message**
- `message_id` (PK, UUID)
- `sender_id` (FK → User.user_id)
- `recipient_id` (FK → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## 3. Relationships

| Relationship | Type | Description |
|-------------|------|-------------|
| User → Property | 1-to-Many | One user (host) can create many properties |
| User → Booking | 1-to-Many | One user can make many bookings |
| Property → Booking | 1-to-Many | One property can be booked many times |
| Booking → Payment | 1-to-1 | Each booking has one payment |
| Booking → Review | 1-to-1 | One booking leads to one review |
| User → Message | 1-to-Many (self-referencing) | Users can send messages to other users |

---

![alt text](<Visual ER Diagram.png>)