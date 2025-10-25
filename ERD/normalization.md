# Database Normalization — Airbnb Project

## 1. Overview

This document explains how normalization principles were applied to the Airbnb database schema to eliminate redundancy and ensure data integrity. The normalization process follows the First, Second, and Third Normal Forms (1NF, 2NF, and 3NF).

---

## 2. Normalization Principles

### **First Normal Form (1NF)**
A table is in 1NF if:
- All values are atomic (no multiple values in one field)
- Each record is unique
- There are no repeating groups or arrays

### **Second Normal Form (2NF)**
A table is in 2NF if:
- It is already in 1NF
- Every non-key attribute depends on the entire primary key (applies mainly to composite keys)

### **Third Normal Form (3NF)**
A table is in 3NF if:
- It is already in 2NF
- There are **no transitive dependencies** (non-key attributes must not depend on other non-key attributes)

In summary, every column must depend **only on the key, the whole key, and nothing but the key.**

---

## 3. Normalization of the Airbnb Database Schema

Our database contains six entities:

- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

Each table was reviewed against 1NF, 2NF, and 3NF.

---

### ✅ **User Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `user_id` (PK) |

- No repeating groups → **1NF OK**
- No partial dependencies (single PK) → **2NF OK**
- No transitive dependencies → **3NF OK**

---

### ✅ **Property Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `property_id` (PK) |

- Atomic values → **1NF OK**
- Single-column PK → **2NF OK**
- No non-key attribute depends on another non-key attribute → **3NF OK**

---

### ✅ **Booking Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `booking_id` (PK) |

- No repeating attributes → **1NF OK**
- No partial dependencies → **2NF OK**
- Each field depends only on `booking_id` → **3NF OK**

---

### ✅ **Payment Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `payment_id` (PK) |

---

### ✅ **Review Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `review_id` (PK) |

---

### ✅ **Message Table (3NF Compliant)**

| Attribute | Depends On |
|-----------|------------|
| All fields | `message_id` (PK) |

---

## 4. Result

The database **fully satisfies 1NF, 2NF, and 3NF**:

| Normal Form | Status |
|-------------|---------|
| 1NF | ✅ Passed |
| 2NF | ✅ Passed |
| 3NF | ✅ Passed |

There are no repeating fields, no partial dependencies, and no transitive dependencies. Each non-key attribute depends only on its table’s primary key, which guarantees a well-structured, scalable, and clean Airbnb database schema.

---

## 5. Conclusion

The Airbnb database design is successfully normalized to **Third Normal Form (3NF)**. This ensures:

- Reduced redundancy
- Better data integrity
- Easier maintenance
- A scalable structure for future features (e.g., wishlist, property categories, notifications)

