# Database Script — 0x02: Seed Data

## ✅ Objective
Populate the Airbnb database with meaningful sample data for testing.

## 📌 Contents
This directory contains:
- `seed.sql` — SQL INSERT statements to populate the database with:
  - Users
  - Properties
  - Bookings
  - Payments

## 📌 Requirements
- Sample data should look realistic
- Maintain valid foreign key relationships
- Include multiple users, properties, and bookings

## 🔧 How to Run
In your terminal:

```bash
mysql -u root -p airbnb_db < seed.sql
