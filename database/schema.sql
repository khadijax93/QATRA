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
-- ============================
-- BLOOD_REQUESTS TABLE
-- ============================

CREATE TABLE blood_requests (
    request_id NUMBER PRIMARY KEY,
    hospital_id NUMBER NOT NULL,
    blood_type VARCHAR2(3)
        CHECK (blood_type IN
        ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    quantity NUMBER NOT NULL,
    urgency_level VARCHAR2(20),
    status VARCHAR2(20) DEFAULT 'OPEN',
    CONSTRAINT fk_request_hospital
        FOREIGN KEY (hospital_id)
        REFERENCES hospitals(hospital_id)
);
-- ============================
-- DONATIONS TABLE
-- ============================

CREATE TABLE donations (
    donation_id NUMBER PRIMARY KEY,
    donor_id NUMBER NOT NULL,
    request_id NUMBER NOT NULL,
    donation_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_donation_donor
        FOREIGN KEY (donor_id)
        REFERENCES donors(donor_id),
    CONSTRAINT fk_donation_request
        FOREIGN KEY (request_id)
        REFERENCES blood_requests(request_id)
);



