# ER Diagram Requirements — AirBnB Clone (alx-airbnb-database/ERD/requirements.md)

## Objective
Create an Entity-Relationship Diagram (ERD) for the AirBnB database using the provided database specification. The diagram must use crow's-foot notation and accurately represent entities, attributes, relationships, cardinalities, and mandatory/optional constraints.

## Entities and Attributes
Use the following entities and attributes exactly as specified:

### User
- user_id: UUID, PRIMARY KEY, Indexed
- first_name: VARCHAR, NOT NULL
- last_name: VARCHAR, NOT NULL
- email: VARCHAR, UNIQUE, NOT NULL
- password_hash: VARCHAR, NOT NULL
- phone_number: VARCHAR, NULL
- role: ENUM (guest, host, admin), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- property_id: UUID, PRIMARY KEY, Indexed
- host_id: UUID, FOREIGN KEY → User(user_id), NOT NULL
- name: VARCHAR, NOT NULL
- description: TEXT, NOT NULL
- location: VARCHAR, NOT NULL
- pricepernight: DECIMAL, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- booking_id: UUID, PRIMARY KEY, Indexed
- property_id: UUID, FOREIGN KEY → Property(property_id), NOT NULL
- user_id: UUID, FOREIGN KEY → User(user_id), NOT NULL
- start_date: DATE, NOT NULL
- end_date: DATE, NOT NULL
- total_price: DECIMAL, NOT NULL
- status: ENUM (pending, confirmed, canceled), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- payment_id: UUID, PRIMARY KEY, Indexed
- booking_id: UUID, FOREIGN KEY → Booking(booking_id), NOT NULL, UNIQUE (1:1)
- amount: DECIMAL, NOT NULL
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

### Review
- review_id: UUID, PRIMARY KEY, Indexed
- property_id: UUID, FOREIGN KEY → Property(property_id), NOT NULL
- user_id: UUID, FOREIGN KEY → User(user_id), NOT NULL
- rating: INTEGER, CHECK 1..5, NOT NULL
- comment: TEXT, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- message_id: UUID, PRIMARY KEY, Indexed
- sender_id: UUID, FOREIGN KEY → User(user_id), NOT NULL
- recipient_id: UUID, FOREIGN KEY → User(user_id), NOT NULL
- message_body: TEXT, NOT NULL
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Relationships & Cardinalities (Crow's Foot)
- User (1) ——< Property (many) : host owns properties (host_id mandatory)
- User (1) ——< Booking (many) : user makes bookings (user_id mandatory)
- Property (1) ——< Booking (many) : property has bookings (property_id mandatory)
- Booking (1) —— (1) Payment : booking has one payment (booking_id mandatory, unique)
- User (1) ——< Review (many) : user writes reviews (user_id mandatory)
- Property (1) ——< Review (many) : property receives reviews (optional for property)
- User (1) ——< Message (many) : user sends messages (sender_id mandatory)
- User (1) ——< Message (many) : user receives messages (recipient_id mandatory)




