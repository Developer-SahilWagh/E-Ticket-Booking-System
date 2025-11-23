# 🎟️ E-Ticket Booking Database System (SQL)

## 📌 Project Overview

This project is a beginner-friendly SQL-based e-ticket booking system that allows users to register, browse events, book tickets, make payments, and view booking history.
The system ensures **real-time seat reservation**, maintains event details, and securely stores payment records—similar to simple ticketing platforms used for concerts, conferences, sports, etc.

It is designed to help beginners understand database design, table relationships, SQL queries and CRUD operations through a practical real-world use case.


## 🚀 Features

### 👤 User Management

* Register new users
* Store profile information
* Maintain booking history

### 🎫 Event Management

* Add and manage event listings
* Store event name, date, venue, total seats, availability

### 🪑 Seat Reservation

* Allocate seats per event
* Block seats once booked
* Prevent double booking

### 💳 Ticket Booking & Payments

* Book seats for events
* Automatically update available seats
* Record secure payment details
* Track payment status

### 🔔 Notification Ready (Optional)

Database supports future integration for:

* Event reminders
* Ticket confirmation alerts




## 🏗️ Database Structure

### 1. Users Table:

Stores user information registered in the system.

### 2. Events Table:

Contains details of events such as name, venue, date, and available seats.

### 3. Seats Table:

Contains seat-wise data for each event and booking status.

### 4. Bookings Table:

Tracks which user booked which event, with date and number of seats.

### 5. Payments Table:

Stores booking payments, amounts, dates, and status.



## 🛠️ Technologies Used

* SQL (MySQL / MariaDB / PostgreSQL)
* Database Design & ER Modeling
* DML, DDL, Joins, Foreign Keys
* Basic Constraints & Relational Concepts




## 🔮 Future Enhancements

* Add stored procedures for automatic booking operations
* Implement admin dashboard using frontend + backend
* Add triggers for real-time seat updates
* Implement event notifications via email/SMS
* Add cancellation & refund modules


**Sahil Wagh**
Beginner SQL Developer | Tech Enthusiast
