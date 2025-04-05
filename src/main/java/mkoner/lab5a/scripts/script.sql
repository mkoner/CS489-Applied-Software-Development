CREATE DATABASE IF NOT EXISTS `cs489_advantis_dental_surgeries`;
USE `cs489_advantis_dental_surgeries`;

-- Value Object: Address
CREATE TABLE Address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100),
    city VARCHAR(100),
    zipCode VARCHAR(20),
    street VARCHAR(200)
);

-- Value Object: Money
CREATE TABLE Money (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(10),
    currencySymbol VARCHAR(5)
);

-- Role Table (1-to-many with User)
CREATE TABLE Role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Base User Table
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(150) UNIQUE,
    password VARCHAR(100),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(id)
);

-- Patient Table (inherits from User)
CREATE TABLE Patient (
    id INT PRIMARY KEY,
    dateOfBirth DATE,
    address_id INT,
    FOREIGN KEY (id) REFERENCES User(id),
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

-- Dentist Table (inherits from User)
CREATE TABLE Dentist (
    id INT PRIMARY KEY,
    specialization VARCHAR(150),
    FOREIGN KEY (id) REFERENCES User(id)
);

-- Surgery Table
CREATE TABLE Surgery (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    phoneNumber VARCHAR(20),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

-- Appointment Table
CREATE TABLE Appointment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dateTime DATETIME NOT NULL,
    status VARCHAR(50),
    patient_id INT,
    dentist_id INT,
    surgery_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (dentist_id) REFERENCES Dentist(id),
    FOREIGN KEY (surgery_id) REFERENCES Surgery(id)
);

-- Bill Table
CREATE TABLE Bill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dateOfBilling DATE,
    dueDate DATE,
    appointment_id INT UNIQUE,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);

-- Payment Table
CREATE TABLE Payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dateTimeOfPayment DATETIME,
    bill_id INT,
    money_id INT,
    FOREIGN KEY (bill_id) REFERENCES Bill(id),
    FOREIGN KEY (money_id) REFERENCES Money(id)
);

-- Notification Table
CREATE TABLE Notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(200),
    recipient VARCHAR(150),
    message TEXT
);
