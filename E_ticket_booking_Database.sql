-- E-Ticket Booking System SQL 

CREATE DATABASE IF NOT EXISTS ETicketBooking;
USE ETicketBooking;


-- 1. TABLE CREATION

CREATE TABLE IF NOT EXISTS Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATE,
    Venue VARCHAR(100),
    TotalSeats INT,
    AvailableSeats INT
);

CREATE TABLE IF NOT EXISTS Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT,
    SeatNumber VARCHAR(10),
    IsBooked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    EventID INT,
    BookingDate DATE,
    SeatsBooked INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


-- 2. SAMPLE DATA INSERTION

-- Insert sample users
INSERT INTO Users (FirstName, LastName, Email, Password, Phone)
VALUES ('John', 'Doe', 'john@example.com', 'pass123', '9999999999'),
       ('Jane', 'Smith', 'jane@example.com', 'pass456', '8888888888');

-- Insert sample events
INSERT INTO Events (EventName, EventDate, Venue, TotalSeats, AvailableSeats)
VALUES ('Music Concert', '2025-02-15', 'City Hall', 100, 100),
       ('Tech Conference', '2025-03-10', 'Tech Park', 150, 150);

-- Insert sample seats
INSERT INTO Seats (EventID, SeatNumber, IsBooked)
VALUES (1, 'A1', FALSE), (1, 'A2', FALSE), (1, 'A3', FALSE),
       (2, 'B1', FALSE), (2, 'B2', FALSE), (2, 'B3', FALSE);



-- 3. BASIC OPERATIONS

-- A. USER REGISTRATION
INSERT INTO Users (FirstName, LastName, Email, Password, Phone)
VALUES ('Alice', 'Brown', 'alice@example.com', 'alice123', '7777777777');

-- B. EVENT CREATION
INSERT INTO Events (EventName, EventDate, Venue, TotalSeats, AvailableSeats)
VALUES ('Art Expo', '2025-04-20', 'Art Gallery', 80, 80);

-- C. BOOKING TICKETS (Example: User 1 books 2 seats for Event 1)
INSERT INTO Bookings (UserID, EventID, BookingDate, SeatsBooked)
VALUES (1, 1, CURDATE(), 2);

-- D. UPDATE AVAILABLE SEATS
UPDATE Events
SET AvailableSeats = AvailableSeats - 2
WHERE EventID = 1;

-- E. MARK SEATS AS BOOKED
UPDATE Seats
SET IsBooked = TRUE
WHERE EventID = 1 AND SeatNumber IN ('A1','A2');

-- F. PAYMENT PROCESSING
INSERT INTO Payments (BookingID, Amount, PaymentDate, PaymentStatus)
VALUES (1, 150.00, CURDATE(), 'Completed');


-- 4. VIEW DATA OPERATIONS


-- View booking history for UserID = 1
SELECT b.BookingID, e.EventName, b.BookingDate, b.SeatsBooked
FROM Bookings b
JOIN Events e ON b.EventID = e.EventID
WHERE b.UserID = 1;

-- View payment history for BookingID = 1
SELECT PaymentID, Amount, PaymentDate, PaymentStatus
FROM Payments
WHERE BookingID = 1;