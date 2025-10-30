#  Partitioning Performance Report — ALX Airbnb Database

##  Overview
This report explains how **table partitioning** was applied to the **Bookings** table to optimize query performance for large datasets in the Airbnb database.

Partitioning helps the database skip irrelevant data by scanning only the needed partitions — greatly improving performance for date-based queries.

---

##  Objective
- Improve query performance on the large `Bookings` table.
- Use **range partitioning** by `start_date` (quarterly).
- Measure performance before and after partitioning.

---

##  1. Partitioning Implementation

###  Partition Strategy
We used **RANGE partitioning** on the `start_date` column, splitting data by **quarters of the year (Q1–Q4)**.

```sql
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);
