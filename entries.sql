-- Create the database
CREATE DATABASE WaterAccessibility;
USE WaterAccessibility;

-- Table for Water Sources
CREATE TABLE Water_Sources (
    Source_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Location VARCHAR(100),
    Capacity INT,  -- Liters per day
    Status ENUM('Functional', 'Seasonal', 'Dry') NOT NULL
);

-- Table for Water Quality
CREATE TABLE Water_Quality (
    Quality_ID INT PRIMARY KEY AUTO_INCREMENT,
    Source_ID INT,
    pH_Level DECIMAL(3,1),
    Contaminants VARCHAR(255),
    Last_Test_Date DATE,
    FOREIGN KEY (Source_ID) REFERENCES Water_Sources(Source_ID) ON DELETE CASCADE
);

-- Table for Household Access
CREATE TABLE Household_Access (
    Household_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(100),
    Distance_to_Nearest_Source DECIMAL(5,2),  -- in km
    Time_Spent_Collecting_Water INT  -- in hours
);

-- Table for Seasonal Variations
CREATE TABLE Seasonal_Variations (
    Season_ID INT PRIMARY KEY AUTO_INCREMENT,
    Source_ID INT,
    Month ENUM('January', 'February', 'March', 'April', 'May', 'June', 
               'July', 'August', 'September', 'October', 'November', 'December') NOT NULL,
    Water_Level ENUM('High', 'Medium', 'Low') NOT NULL,
    FOREIGN KEY (Source_ID) REFERENCES Water_Sources(Source_ID) ON DELETE CASCADE
);

-- Table for Health Impact
CREATE TABLE Health_Impact (
    Case_ID INT PRIMARY KEY AUTO_INCREMENT,
    Household_ID INT,
    Disease VARCHAR(100),
    Cases_Reported INT,
    Date_Reported DATE,
    FOREIGN KEY (Household_ID) REFERENCES Household_Access(Household_ID) ON DELETE CASCADE
);
