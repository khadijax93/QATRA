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
-- ============================
-- DONORS TABLE
-- ============================

CREATE TABLE donors (
    donor_id NUMBER PRIMARY KEY,
    blood_type VARCHAR2(3)
        CHECK (blood_type IN
        ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    last_donation_date DATE,
    eligible CHAR(1) DEFAULT 'Y',
    CONSTRAINT fk_donor_user
        FOREIGN KEY (donor_id)
        REFERENCES users(user_id)
);

