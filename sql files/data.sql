-- Insert sample data into Water Sources
INSERT INTO Water_Sources (Name, Location, Capacity, Status) VALUES
('Borehole A', 'Marsabit', 5000, 'Functional'),
('River B', 'Isiolo', 10000, 'Seasonal'),
('Well C', 'Garissa', 3000, 'Dry'),
('Borehole D', 'Wajir', 7000, 'Functional'),
('Lake E', 'Turkana', 15000, 'Functional');

-- Insert sample data into Water Quality
INSERT INTO Water_Quality (Source_ID, pH_Level, Contaminants, Last_Test_Date) VALUES
(1, 7.2, 'None', '2025-01-15'),
(2, 6.5, 'E. coli', '2025-01-10'),
(3, 5.8, 'Lead, Bacteria', '2024-12-20'),
(4, 7.0, 'None', '2025-01-12'),
(5, 8.1, 'None', '2025-01-08');

-- Insert sample data into Household Access
INSERT INTO Household_Access (Location, Distance_to_Nearest_Source, Time_Spent_Collecting_Water) VALUES
('Marsabit Village 1', 2.5, 30),
('Isiolo Town', 1.2, 15),
('Garissa Rural', 5.0, 60),
('Wajir Center', 3.5, 45),
('Turkana South', 0.8, 10);

-- Insert sample data into Seasonal Variations
INSERT INTO Seasonal_Variations (Source_ID, Month, Water_Level)
VALUES
    (1, 'January', 'High'),
    (1, 'February', 'Medium'),
    (2, 'March', 'Low'),
    (3, 'April', 'High'),
    (4, 'May', 'Medium');



-- Insert sample data into Health Impact
INSERT INTO Health_Impact (Household_ID, Disease, Cases_Reported, Date_Reported) VALUES
(1, 'Cholera', 5, '2025-01-20'),
(2, 'Diarrhea', 8, '2025-01-18'),
(3, 'Typhoid', 10, '2024-12-25'),
(4, 'Dysentery', 6, '2025-01-05'),
(5, 'Cholera', 3, '2025-01-22');
