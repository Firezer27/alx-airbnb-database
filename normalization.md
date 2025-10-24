# 1. Normalize Your Database Design
## Objective

The goal of this document is to apply database normalization principles to the Airbnb database design to eliminate redundancy, ensure data consistency, and improve performance.
This process brings the database up to the Third Normal Form (3NF).

## What is Normalization?

Normalization is a step-by-step process used in database design to structure data efficiently by dividing large tables into smaller, related ones and defining relationships between them.
This reduces data duplication and improves data integrity.

Normalization typically follows these main stages:

- First Normal Form (1NF)

- Second Normal Form (2NF)

- Third Normal Form (3NF)

### Step 1: First Normal Form (1NF)
  - Rule

Each table must have a primary key.

Each attribute must contain atomic (indivisible) values.

There should be no repeating groups or arrays.

### Application in Airbnb Database

Table	Check	Example

| Table        | Check                                      | Example                                         |
| ------------ | ------------------------------------------ | ----------------------------------------------- |
| **User**     | Each user identified by `user_id`.         | `first_name`, `email` hold single values.       |
| **Property** | Each property identified by `property_id`. | `location`, `pricepernight` hold single values. |
| **Booking**  | Each booking identified by `booking_id`.   | `start_date`, `end_date` are atomic.            |
| **Payment**  | Each payment identified by `payment_id`.   | No repeating fields.                            |
| **Review**   | Each review identified by `review_id`.     | `rating` is a single value (1–5).               |
| **Message**  | Each message identified by `message_id`.   | `message_body` holds one message.               |


 Result: All tables satisfy 1NF because all fields are atomic and uniquely identified by primary keys.

### Step 2: Second Normal Form (2NF)
 Rule

- The table must already be in 1NF.

- All non-key attributes must depend on the whole primary key, not part of it.

## Application in Airbnb Database

Since all tables use single-column primary keys (e.g., user_id, property_id), partial dependency does not exist.

| Table        | Primary Key   | Dependent Attributes                                |
| ------------ | ------------- | --------------------------------------------------- |
| **User**     | `user_id`     | `first_name`, `last_name`, `email`, `password_hash` |
| **Property** | `property_id` | `name`, `description`, `location`, `pricepernight`  |
| **Booking**  | `booking_id`  | `start_date`, `end_date`, `total_price`, `status`   |
| **Payment**  | `payment_id`  | `amount`, `payment_method`, `payment_date`          |
| **Review**   | `review_id`   | `rating`, `comment`, `created_at`                   |
| **Message**  | `message_id`  | `message_body`, `sent_at`                           |


 - Result: The design satisfies 2NF, as all non-key attributes depend entirely on the primary key.

### Step 3: Third Normal Form (3NF)
Rule:

- The table must be in 2NF.

- There must be no transitive dependency — i.e., non-key attributes should not depend on other non-key attributes.

 Application in Airbnb Database
| Table        | Check | Explanation                                                                                  |
| ------------ | ----- | -------------------------------------------------------------------------------------------- |
| **User**     | ✅     | All attributes depend only on `user_id`; `email` and `role` are independent of other fields. |
| **Property** | ✅     | Attributes depend on `property_id`; `host_id` is a foreign key, not a transitive dependency. |
| **Booking**  | ✅     | All attributes depend only on `booking_id`; `user_id` and `property_id` are foreign keys.    |
| **Payment**  | ✅     | Attributes like `amount` and `payment_method` depend only on `payment_id`.                   |
| **Review**   | ✅     | `rating` and `comment` depend on `review_id`.                                                |
| **Message**  | ✅     | `message_body` and `sent_at` depend only on `message_id`.                                    |


- Result: The design satisfies 3NF because there are no transitive dependencies between non-key attributes.


## After applying normalization:

- The Airbnb database is fully in Third Normal Form (3NF).

- There is no redundancy or update anomaly.

- Data is organized efficiently and maintains integrity across all relationships.

- This design is optimized for scalability, reliability, and performance
