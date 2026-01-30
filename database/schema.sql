-- QATRA
-- Database Schema
-- Oracle SQL Compatible
-- Tables will be defined below
-- ============================
-- USERS TABLE
-- ============================

CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    city VARCHAR2(50) NOT NULL,
    role VARCHAR2(20)
        CHECK (role IN ('HOSPITAL', 'DONOR', 'ADMIN'))
);
-- ============================
-- HOSPITALS TABLE
-- ============================

CREATE TABLE hospitals (
    hospital_id NUMBER PRIMARY KEY,
    hospital_name VARCHAR2(150) NOT NULL,
    CONSTRAINT fk_hospital_user
        FOREIGN KEY (hospital_id)
        REFERENCES users(user_id)
);
