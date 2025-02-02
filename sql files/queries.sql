-- 1. Identify Water Sources with Contamination Issues
SELECT Water_Sources.Name, Water_Sources.Location, Water_Quality.pH_Level, 
       Water_Quality.Contaminants, Water_Quality.Last_Test_Date
FROM Water_Sources
JOIN Water_Quality ON Water_Sources.ID = Water_Quality.Source_ID
WHERE Water_Quality.Contaminants <> 'None';

-- 2. Find Households Spending the Most Time Collecting Water
SELECT Household_Access.Location, Household_Access.Distance_to_Nearest_Source, 
       Household_Access.Time_Spent_Collecting_Water
FROM Household_Access
ORDER BY Household_Access.Time_Spent_Collecting_Water DESC
LIMIT 5;

-- 3. Seasonal Water Levels per Source
SELECT Water_Sources.Name, Seasonal_Variations.Month, Seasonal_Variations.Water_Level
FROM Water_Sources
JOIN Seasonal_Variations ON Water_Sources.ID = Seasonal_Variations.Source_ID
ORDER BY Water_Sources.Name, FIELD(Seasonal_Variations.Month, 'January', 'February', 'March', 'April', 
         'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

-- 4. Correlation Between Water Quality and Disease Cases
SELECT Water_Quality.Source_ID, Water_Sources.Name, Water_Quality.Contaminants, 
       Health_Impact.Disease, SUM(Health_Impact.Cases_Reported) AS Total_Cases_Reported
FROM Water_Quality
JOIN Water_Sources ON Water_Quality.Source_ID = Water_Sources.ID
JOIN Health_Impact ON Health_Impact.Household_ID IN 
    (SELECT Household_Access.ID FROM Household_Access 
     WHERE Household_Access.Distance_to_Nearest_Source < 5)
WHERE Water_Quality.Contaminants <> 'None'
GROUP BY Water_Quality.Source_ID, Water_Quality.Contaminants, Health_Impact.Disease
ORDER BY Total_Cases_Reported DESC;

-- 5. Most Affected Areas by Waterborne Diseases
SELECT Household_Access.Location, Health_Impact.Disease, 
       SUM(Health_Impact.Cases_Reported) AS Total_Cases_Reported
FROM Health_Impact
JOIN Household_Access ON Health_Impact.Household_ID = Household_Access.ID
GROUP BY Household_Access.Location, Health_Impact.Disease
ORDER BY Total_Cases_Reported DESC
LIMIT 5;

-- 6. Functional vs. Non-Functional Water Sources
SELECT Water_Sources.Status, COUNT(*) AS Total_Number_of_Sources
FROM Water_Sources
GROUP BY Water_Sources.Status;
