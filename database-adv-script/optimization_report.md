#  Query Optimization Report — ALX Airbnb Database

##  Overview
This document describes the optimization process for a **complex SQL query** that retrieves bookings with user, property, and payment details from the Airbnb database.

The goal is to **reduce execution time**, **minimize resource usage**, and **improve performance** using indexing and query refactoring.

---

##  Objective
- Retrieve **bookings**, **user details**, **property details**, and **payment details** efficiently.
- Identify and fix performance bottlenecks.
- Measure improvement after optimization.

---

##  1. Initial Query (Unoptimized)

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM
    Bookings b
    JOIN Users u ON b.user_id = u.user_id
    JOIN Properties p ON b.property_id = p.property_id
    LEFT JOIN Payments pay ON pay.booking_id = b.booking_id;
