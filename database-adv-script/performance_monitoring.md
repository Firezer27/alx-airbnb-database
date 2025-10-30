#  Database Performance Monitoring and Refinement Report

##  Objective
The goal of this task is to continuously **monitor**, **analyze**, and **improve** database performance for the **ALX Airbnb Database**.  
By using tools such as `EXPLAIN ANALYZE` and `SHOW PROFILE`, we identified slow queries, bottlenecks, and applied schema or indexing adjustments to optimize performance.

---

##  1. Tools and Commands Used

###  1.1 EXPLAIN / EXPLAIN ANALYZE
Used to analyze how the database executes SQL queries and identify performance bottlenecks.

Example:
```sql
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE user_id = 12;
