# DAY- 7 :

-- CAB BOOKING DATA ANALYSIS : DriveNxt

/*
Problem Defination :
1. To Design Database for CAB BOOKING DATA ANALYSIS
2. Design Database must performed Smooth Operations
3. With the help of DriveNxt Database we can able to Perform  CSAT  Anaylsis.
*/

-- Create Database : DriveNxt
CREATE DATABASE IF NOT EXISTS DriveNxt;

-- Use DriveNxt :
-- Use DriveNxt :
USE DriveNxt;

-- Create Schema : Customers, Drivers, Cab, Booking, Trip_Detail, Feeedback :


CREATE TABLE Customers (
    Customer_Id VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    Customer_Name VARCHAR(10) NOT NULL,
    Customer_Age INT NOT NULL,
    Customer_Gender ENUM('Male', 'Female', 'Others'),
    Customer_MobileNo BIGINT NOT NULL,
    Customer_Location VARCHAR(10) NOT NULL
);

-- ADD THIS FIELD IF It is Required : Customer_Email VARCHAR(20) NOT NULL 


CREATE TABLE Drivers (
    Driver_Id VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    Driver_Name VARCHAR(10) NOT NULL,
    Driver_Age INT NOT NULL,
    Driver_Gender ENUM('Male', 'Female', 'Others') DEFAULT 'Male' NOT NULL,
    Driver_Email VARCHAR(20) NOT NULL,
    Driver_MobileNo BIGINT NOT NULL,
    Driver_Address VARCHAR(10) NOT NULL,
    Driver_Experience DECIMAL(2 , 1 ) NOT NULL
);

-- Create Table : Cab
CREATE TABLE Cab (
    Driver_Id VARCHAR(5) NOT NULL,
    Customer_Id VARCHAR(5) NOT NULL,
    Cab_RegistrationID VARCHAR(12) PRIMARY KEY UNIQUE NOT NULL,
    Cab_Type ENUM('Sedan', 'Suv', 'Hatchback', 'Coupe', 'Bike', 'Auto') NOT NULL,
    Cab_Comfortlevel ENUM('Yes', 'No') NOT NULL,
    Cab_Capacity ENUM('1', '2', '3', '4', '6') NOT NULL,
    Cab_Maintenance DATETIME NOT NULL,
    Cab_Insurance ENUM('Yes', 'No') NOT NULL,
    FOREIGN KEY (Driver_Id)
        REFERENCES Drivers (Driver_Id),
    FOREIGN KEY (Customer_Id)
        REFERENCES Customers (Customer_Id)
);

-- Create Table : Booking
CREATE TABLE Booking (
    Customer_Id VARCHAR(5) NOT NULL,
    Driver_Id VARCHAR(5) NOT NULL,
    Booking_Id VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
    Pickup_Location VARCHAR(10) NOT NULL,
    Trip_Pickuptime DATETIME NOT NULL,
    Drop_Location VARCHAR(10) NOT NULL,
    Trip_DropTime DATETIME NOT NULL,
    Booking_Status ENUM('Scheduled', 'Confirmed', 'cancelled') DEFAULT 'Confirmed' NOT NULL,
    FOREIGN KEY (Customer_Id)
        REFERENCES Customers (Customer_Id),
    FOREIGN KEY (Driver_Id)
        REFERENCES Drivers (Driver_Id)
);

-- Create Table : Trip_Details
CREATE TABLE Trip_Details (
    Customer_Id VARCHAR(5) NOT NULL,
    Driver_Id VARCHAR(5) NOT NULL,
    Booking_Id VARCHAR(5) NOT NULL,
    Cab_RegistrationID VARCHAR(12) NOT NULL,
    Trip_DistanceKM DECIMAL(2 , 1 ) NOT NULL,
    Trip_Fare DECIMAL(5 , 1 ) NOT NULL,
    Trip_Payment ENUM('Cash', 'Card', 'UPI') DEFAULT 'Cash' NOT NULL,
    FOREIGN KEY (Customer_Id)
        REFERENCES Customers (Customer_Id),
    FOREIGN KEY (Driver_Id)
        REFERENCES Drivers (Driver_Id),
    FOREIGN KEY (Booking_Id)
        REFERENCES Booking (Booking_Id),
    FOREIGN KEY (Cab_RegistrationID)
        REFERENCES Cab (Cab_RegistrationID)
);

-- Create Table : Feedback
CREATE TABLE Feedback (
    Customer_Id VARCHAR(5) NOT NULL,
    Driver_Id VARCHAR(5) NOT NULL,
    Booking_Id VARCHAR(5) NOT NULL,
    Customer_Feedback TEXT,
    Driver_Feedback TEXT,
    Customer_Rating DECIMAL(2 , 1 ) CHECK (Customer_Rating BETWEEN 1 AND 5),
    Driver_Rating DECIMAL(2 , 1 ) CHECK (Driver_Rating BETWEEN 1 AND 5),
    FOREIGN KEY (Customer_Id)
        REFERENCES Customers (Customer_Id),
    FOREIGN KEY (Driver_Id)
        REFERENCES Drivers (Driver_Id),
    FOREIGN KEY (Booking_Id)
        REFERENCES Booking (Booking_Id)
);

-- DESCRIBE TABLE :
DESCRIBE Customers;
DESCRIBE Drivers ;
DESCRIBE Cab;
DESCRIBE Booking;
DESCRIBE Trip_Details;
DESCRIBE Feedback;

-- Insert Values in the Table :


SELECT 
    *
FROM
    Customers;
    
    
SELECT 
    *
FROM
    Drivers;
    

    
