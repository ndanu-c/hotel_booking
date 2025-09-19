-- Create Database
CREATE DATABASE hotel_booking;
USE hotel_booking;

-- Guest Table
CREATE TABLE Guest (
  guest_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20) NOT NULL
);

-- Room Table
CREATE TABLE Room (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_number VARCHAR(10) UNIQUE NOT NULL,
  type VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);

-- Booking Table
CREATE TABLE Booking (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT NOT NULL,
  booking_date DATE NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL,
  status VARCHAR(50) DEFAULT 'Pending',
  CONSTRAINT fk_booking_guest FOREIGN KEY (guest_id) 
    REFERENCES Guest(guest_id)
    ON DELETE CASCADE,
  CHECK (check_out > check_in)
);

-- Payment Table
CREATE TABLE Payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
  payment_date DATE NOT NULL,
  method VARCHAR(50) NOT NULL,
  CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) 
    REFERENCES Booking(booking_id)
    ON DELETE CASCADE
);

-- Booking_Room Junction Table
CREATE TABLE Booking_Room (
  booking_id INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (booking_id, room_id),
  CONSTRAINT fk_bookingroom_booking FOREIGN KEY (booking_id) 
    REFERENCES Booking(booking_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_bookingroom_room FOREIGN KEY (room_id) 
    REFERENCES Room(room_id)
    ON DELETE CASCADE
);

-- Item Table
CREATE TABLE Item (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255)
);

-- Room_Item Junction Table
CREATE TABLE Room_Item (
  room_id INT NOT NULL,
  item_id INT NOT NULL,
  PRIMARY KEY (room_id, item_id),
  CONSTRAINT fk_roomitem_room FOREIGN KEY (room_id) 
    REFERENCES Room(room_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_roomitem_item FOREIGN KEY (item_id) 
    REFERENCES Item(item_id)
    ON DELETE CASCADE
);

-- Staff Table
CREATE TABLE Staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  role VARCHAR(50) NOT NULL,
  phone VARCHAR(20) UNIQUE
);

-- Service Table
CREATE TABLE Service (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);

-- Booking_Service Junction Table
CREATE TABLE Booking_Service (
  booking_id INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (booking_id, service_id),
  CONSTRAINT fk_bookingservice_booking FOREIGN KEY (booking_id) 
    REFERENCES Booking(booking_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_bookingservice_service FOREIGN KEY (service_id) 
    REFERENCES Service(service_id)
    ON DELETE CASCADE
);

-- Insert sample Guests
INSERT INTO Guest (full_name, email, phone)
VALUES 
('John Doe', 'john@example.com', '0712345678'),
('Mary Smith', 'mary@example.com', '0723456789');

-- Insert sample Rooms
INSERT INTO Room (room_number, type, price)
VALUES
('101', 'Single', 50.00),
('102', 'Double', 80.00),
('201', 'Suite', 150.00);

-- Insert sample Items
INSERT INTO Item (name, description)
VALUES
('Bed', 'Queen size bed'),
('TV', '42-inch Smart TV'),
('Fridge', 'Mini fridge');

-- Assign items to Rooms
INSERT INTO Room_Item (room_id, item_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(3, 3);

-- Insert a Booking
INSERT INTO Booking (guest_id, booking_date, check_in, check_out, status)
VALUES
(1, '2025-09-15', '2025-09-20', '2025-09-25', 'Confirmed');

-- Assign Rooms to Booking
INSERT INTO Booking_Room (booking_id, room_id)
VALUES
(1, 1),
(1, 2);

-- Insert Payments
INSERT INTO Payment (booking_id, amount, payment_date, method)
VALUES
(1, 50.00, '2025-09-15', 'Credit Card'),
(1, 80.00, '2025-09-20', 'Cash');

-- Insert Services
INSERT INTO Service (name, price)
VALUES
('Breakfast', 10.00),
('Spa', 40.00);

-- Assign Services to Booking
INSERT INTO Booking_Service (booking_id, service_id)
VALUES
(1, 1),
(1, 2);

-- Insert Staff
INSERT INTO Staff (full_name, role, phone)
VALUES
('Alice Johnson', 'Manager', '0734567890'),
('Bob Lee', 'Receptionist', '0745678901');
