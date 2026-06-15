-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
create type user_role as enum('Football Fan','Ticket Manager')

CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(50),
    email varchar(50) unique,
    role user_role not null default 'Football Fan',
    phone_number varchar(15)
    
    -- Write your constraint to make 'user_id' the Primary Key
    -- Write your constraint to ensure 'email' values are never duplicated
    -- Write your check constraint to restrict 'role' to specific allowed strings
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
create type match_status as enum('Postponed','Sold Out','Selling Fast','Available');
CREATE TABLE Matches (
    match_id serial primary key,
    fixture text,
    tournament_category varchar(100),
    base_ticket_price decimal(10,2) check  (base_ticket_price >= 0),
    match_status match_status
    
    -- Write your constraint to make 'match_id' the Primary Key
    -- Write your check constraint to prevent negative ticket prices
    -- Write your check constraint to restrict 'match_status' values
);