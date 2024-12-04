/*In this week's challenge, we have the results from the New York City Public School standardized math exams from 2013 to 2019.  
Examining only 8th grade students, find the percentage of female students that achieved a Level 4 score for each district in 
the years 2013 and 2019.  Then rank the districts according to the biggest improvement in this percentage. */

with Filtered_Data as (
SELECT *
FROM `challenge219`
WHERE `Grade` = 8 
  AND `Category` = 'Female' 
  AND (`Year` = 2013 OR `Year` = 2019)
)
, Pivoted_Data as (
SELECT `District`,
   MAX(CASE WHEN Year = 2013 THEN `% Level 4` END) AS year_2013,
    MAX(CASE WHEN Year = 2019 THEN `% Level 4`  END) AS year_2019
FROM Filtered_Data
Group by `District`
)
SELECT `District`,
year_2013,
year_2019,
 ROUND((year_2013 - year_2019), 2) AS percentage_change
FROM Pivoted_Data
Order by percentage_change ASC
LIMIT 3;