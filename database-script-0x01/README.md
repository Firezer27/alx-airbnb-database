#  2. Design Database Schema (DDL)

##  Objective
This module defines the **database schema** for the Airbnb Clone backend.  
It uses SQL DDL (Data Definition Language) statements to create tables, define relationships, and enforce data integrity through primary keys, foreign keys, and constraints.

---

##  Entities and Relationships
The database includes six main entities:

| Entity | Description |
|---------|--------------|
| **User** | Stores all registered users (guests, hosts, and admins). |
| **Property** | Contains property listings posted by hosts. |
| **Booking** | Manages booking details between users and hosts. |
| **Payment** | Handles transaction records for each booking. |
| **Review** | Stores property reviews submitted by users. |
| **Message** | Allows users to send and receive messages. |

Each table has a **primary key**, and foreign keys are used to define relationships:
- `Property.host_id` → `User.user_id`
- `Booking.property_id` → `Property.property_id`
- `Booking.user_id` → `User.user_id`
- `Payment.booking_id` → `Booking.booking_id`
- `Review.property_id` → `Property.property_id`
- `Review.user_id` → `User.user_id`
- `Message.sender_id` and `recipient_id` → `User.user_id`

---

##  Key Constraints and Optimizations
- **Primary Keys:** Every table uses a UUID-based primary key for unique identification.
- **Foreign Keys:** Enforce referential integrity across related tables.
- **Check Constraints:** Validate fields like `rating`, `status`, and `payment_method`.
- **Indexes:** Created on frequently queried columns (e.g., `email`, `property_id`, `booking_id`) for faster lookups.
- **Cascade Deletes:** Ensure related records are removed automatically to maintain data consistency.

---

##  Example Queries

**View all properties for a specific host:**
```sql
SELECT * FROM Property WHERE host_id = 'uuid-value';
