-- Create database
CREATE DATABASE RaceDay;
GO
USE RaceDay;
GO

-- Event table
CREATE TABLE Event (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL UNIQUE,
    Date DATE NOT NULL,
    Location VARCHAR(150) NOT NULL
);

-- Route table
CREATE TABLE Route (
    RouteID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    Map VARCHAR(255),
    Elevation VARCHAR(100),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Category table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- UserProfile table
CREATE TABLE UserProfile (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10) CHECK (Gender IN ('Male','Female','Other')),
    ContactInfo VARCHAR(150) UNIQUE,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Organiser','Participant'))
);

-- Registration table
CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    UserID INT NOT NULL,
    PaymentStatus VARCHAR(50) DEFAULT 'Pending',
    BibPayment VARCHAR(50),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);

-- Result table
CREATE TABLE Result (
    ResultID INT PRIMARY KEY IDENTITY(1,1),
    RegistrationID INT NOT NULL UNIQUE,
    FinishTime TIME,
    Position INT,
    Pace VARCHAR(50),
    FOREIGN KEY (RegistrationID) REFERENCES Registration(RegistrationID)
);


-- Inserting Sample Data 

-- Events
INSERT INTO Event (Name, Date, Location)
VALUES ('Comrades Marathon', '2026-06-14', 'Durban'),
       ('Soweto Marathon', '2026-11-02', 'Johannesburg');

-- Routes
INSERT INTO Route (EventID, Distance, Map, Elevation)
VALUES (1, 89.00, 'ComradesRouteMap.png', '1200m'),
       (2, 42.20, 'SowetoRouteMap.png', '950m');

-- Categories
INSERT INTO Category (EventID, Name, Distance)
VALUES (1, 'Ultra Marathon', 89.00),
       (2, 'Full Marathon', 42.20);

-- User Profiles
INSERT INTO UserProfile (Name, Age, Gender, ContactInfo, Role)
VALUES ('Thabo Mokoena', 29, 'Male', 'thabo@example.com', 'Participant'),
       ('Sarah Jacobs', 34, 'Female', 'sarah@example.com', 'Participant'),
       ('John Dlamini', 40, 'Male', 'john@example.com', 'Organiser');

-- Registrations
INSERT INTO Registration (EventID, CategoryID, UserID, PaymentStatus, BibPayment)
VALUES (1, 1, 1, 'Paid', 'Yes'),
       (2, 2, 2, 'Pending', 'No');

-- Results
INSERT INTO Result (RegistrationID, FinishTime, Position, Pace)
VALUES (1, '06:45:00', 120, '4:30/km'),
       (2, NULL, NULL, NULL);
