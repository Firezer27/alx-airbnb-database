#  Airbnb Clone Database Seeding

##  Objective
This script populates the Airbnb Clone database with **sample data** for testing and development.  
It includes realistic entries for users, properties, bookings, payments, reviews, and messages.

---

##  Tables Seeded
| Table | Description |
|--------|--------------|
| **User** | Contains host, guest, and admin sample users. |
| **Property** | Represents property listings with names, locations, and prices. |
| **Booking** | Shows real-world booking records with status values. |
| **Payment** | Records payment details tied to bookings. |
| **Review** | Stores feedback and ratings from guests. |
| **Message** | Contains communication between guests and hosts. |

---

name> -d airbnb_clone_db -f seed.sql
