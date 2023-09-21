/* What is my average workout time and my average heart rate during workouts? Does it change based on the day of the week? 
Avg duration - 66 min,   Avg heart rate -  120 bpm. Monday had highest avg heart rate at 123 bpm and on Tuesday workouts lasted the longest at an avg of 72 min. */
SELECT
AVG(Duration_min)
FROM dbo.workout_data

SELECT
AVG(Avg_Heart_Rate_bpm)
FROM dbo.workout_data

SELECT
AVG(Duration_min) AS duration,
AVG(Avg_Heart_Rate_bpm) AS avg_heart_rate,
Day_of_the_Week
FROM dbo.workout_data
GROUP BY Day_of_the_Week

/* How many days do I workout per month and did it change over the course of the year?  
Workout count decreased by month as 2022 progressed. 2023 progressively increased on avg and peaked in July 2023 with 49 workouts.*/
SELECT
COUNT(workout_type),
MONTH(Date) AS month
FROM dbo.workout_data
GROUP BY MONTH(Date)

/* What months of the year were my average active energy the highest? lowest?
May 2023 - 657 avg active energy, August 2022 - 251 avg active energy. */
SELECT
AVG(Active_Energy_kcal)
FROM dbo.workout_data

SELECT
AVG(Active_Energy_kcal) AS avg_active_energy,
MONTH(Date) AS month
FROM dbo.workout_data
GROUP BY Month(Date)

/* What was my average step count for workouts?
Avg step count -  1645 steps. */
SELECT
AVG(Step_Count_count)
FROM dbo.workout_data

/* When were the most common times for my workouts to take place? What workout start time showed the highest active energy? 
11 am was the most common workout time with 146 workouts during this time. Avg active energy peaked at 9 am and was the highest between the hours of 9-11 am.*/
SELECT
COUNT(workout_type),
DATEPART(hh,Start_Time) AS hour_start_time
FROM dbo.workout_data
GROUP BY DATEPART(hh,Start_Time)
ORDER BY DATEPART(hh,Start_Time)

SELECT
AVG(Active_Energy_kcal) AS avg_active_energy,
DATEPART(hh,Start_Time) AS hour_start_time
FROM dbo.workout_data
GROUP BY DATEPART(hh,Start_Time)
ORDER BY DATEPART(hh,Start_Time)
