# Vacation Booking API

A RESTful Spring Boot API for managing vacation bookings with shopping cart functionality, and order processing.

## What It Does

This API powers a vacation booking platform with the following capabilities:

**Customer Management**
- View existing customers
- Create new customer profiles
- Edit customer information

**Vacation Shopping**
- Browse available vacation packages
- Add vacations to shopping cart
- Customize party size for each booking
- Browse optional excursions as add-ons
- Add excursions to enhance vacation packages

**Checkout & Order Processing**
- Process cart checkout
- Generate purchase confirmations
- Create unique order tracking numbers (UUID-based)
- Persist completed bookings


## Tech Stack

- **Java 17** - Core language
- **Spring Boot** - Application framework
- **Spring MVC** - RESTful API endpoints
- **Spring Data JPA** - ORM and database persistence
- **MySQL** - Relational database
- **Angular** - Frontend integration (CORS-enabled)

## Setup

1. Copy `.env.template` to `.env` and fill in the password
2. Install node packages:
```bash
    npm i
```
3. Run the backend application:
```bash
   docker-compose up --build
```
4. The database will be automatically initialized with sample data from database/init.sql
5. Run frontend:
```bash
  cd frontend
  npm run start
    
```
### Note
- To reset database: `docker-compose down -v` (the `-v` removes volumes)

