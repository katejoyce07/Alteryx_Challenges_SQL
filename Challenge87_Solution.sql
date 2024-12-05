/*Using the Input data below (or a similar dataset for your location, which can be found 
https://www.timeanddate.com/sun/usa/ for US-based users), calculate the amount of daylight
 for each day in September, as well as the day-to-day differences in daylight and 
 the total difference from September 1 to September 30. */
 
WITH data_cleanse AS (
    SELECT *
    FROM `challenge87`
    WHERE `Sep` IS NOT NULL
),
tidy_time AS (
    SELECT 
        `Sep`,
        LEFT(`Sunrise`, 4) AS Sunrise,  
        LEFT(`Sunset`, 4) AS Sunset
    FROM data_cleanse
),
Seconds AS (
    SELECT *,
STR_TO_DATE(CONCAT(
                LPAD(SUBSTRING_INDEX(Sunrise, ':', 1), 2, '0'), ':', 
                LPAD(SUBSTRING_INDEX(Sunrise, ':', -1), 2, '0'), ':00'
            ), '%H:%i:%s') AS Sunrise2,
        
STR_TO_DATE(CONCAT(
                LPAD(SUBSTRING_INDEX(Sunset, ':', 1), 2, '0'), ':', 
                LPAD(SUBSTRING_INDEX(Sunset, ':', -1), 2, '0'), ':00'
            ), '%H:%i:%s') AS Sunset2
    FROM tidy_time
)
, Day_Length as (
SELECT *,
TIMESTAMPDIFF(MINUTE, Sunset2, Sunrise2) + (60 * 12) AS day_length_minutes
FROM Seconds
)
SELECT *,
 day_length_minutes - LAG(day_length_minutes) OVER (ORDER BY `Sep`) AS difference_in_minutes
FROM Day_Length ;


