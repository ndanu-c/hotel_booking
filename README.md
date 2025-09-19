
# Hotel Booking System Database

## 📌 Project Overview
This project is a relational database management system (DBMS) designed for a **Hotel Booking System**.  
It was implemented in **MySQL**.  

The database models the core operations of a hotel, including:
- Managing guests
- Handling room bookings
- Processing payments
- Managing staff
- Tracking items in rooms
- Adding extra services (meals, spa, etc.)

---

## 🏗️ Database Schema

### Entities (Tables)
1. **Guest** – stores guest details (name, email, phone).
2. **Room** – stores room details (room number, type, price).
3. **Booking** – records guest bookings with check-in/out dates.
4. **Payment** – records payments linked to bookings.
5. **Item** – stores items/amenities (TV, Bed, Fridge).
6. **Staff** – stores hotel staff details and roles.
7. **Service** – stores extra services (meals, spa, etc.).

### Junction Tables (for Many-to-Many relationships)
- **Booking_Room** – links bookings and rooms.
- **Room_Item** – links rooms and items.
- **Booking_Service** – links bookings and services.

---

## 🔑 Constraints Implemented
- **Primary Keys (PK):** All tables have unique identifiers.
- **Foreign Keys (FK):** Maintain relationships between tables.
- **NOT NULL:** Important fields (e.g., guest name, booking dates) must always have values.
- **UNIQUE:** Prevent duplicate entries (e.g., room number, email).
- **CHECK:** Enforces rules like `price > 0` and `check_out > check_in`.
- **ON DELETE CASCADE:** Ensures related records are deleted automatically.

---

## 📂 File Structure
- `hotel_booking.sql` → Contains the full schema and sample data.

---

## 📊 Sample Data
The database includes example data:
- Guests (John Doe, Mary Smith)
- Rooms (Single, Double, Suite)
- Items (Bed, TV, Fridge)
- Bookings with payments
- Services (Breakfast, Spa)
- Staff (Manager, Receptionist)

---

## 🚀 How to Run
1. Open MySQL and create the database:
   ```sql
   source hotel_booking.sql;

2. Run queries to explore:
   -SELECT * FROM Guest;
   -SELECT * FROM Booking;
   -SELECT * FROM Room;
