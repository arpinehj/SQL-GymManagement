# ADVANCED OPTIONS: QUERY WITH GROUP BY, STORED PROCEDURE, TRIGGER, EVENT AND CREATE A VIEW

# Queries with GROUP BY and HAVING 
# 1. How many instructors in each city (only display the cities that have at least two instructor)?
# Change SQL mode to allow GROUP BY without all selected columns having to be aggregated 
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', '')); 

SELECT COUNT(i.Instructor_ID), i.City 
FROM Instructors i 
GROUP BY i.City
HAVING COUNT(i.Instructor_ID) > 1
ORDER BY COUNT(i.Instructor_ID) DESC; 

# 2. How many males and females joined the gym after 2015 (only display if more than 3 members have joined in this period)?
SELECT COUNT(m.Member_ID), m.Gender
FROM Members m 
WHERE m.Joining_Date > '2015-01-01'
GROUP BY m.Gender
HAVING COUNT(m.Member_ID) > 3;  

# 3. Total Monthly Amount and Sign Up Fee & how many members in each membership type
SELECT SUM(m2.Monthly_Amount) as 'Monthly Amount £', SUM(m2.Signup_Fee) as 'Sign Up Fee £',
COUNT(m2.Type_ID) as 'How many members', Type_Name as 'Type Name'
FROM Membership m2
GROUP BY Type_Name;

# Create a STORED PROCEDURE 

# 1. Update Users table if a user has updated their password  

DELIMITER $$
CREATE PROCEDURE UpdatePwd
(IN id_of_user INT, 
IN user_password VARCHAR(25))
BEGIN 
    UPDATE Users
    SET `Password` = user_password
    WHERE User_ID = id_of_user;
END $$
DELIMITER ; 

CALL UpdatePwd(109, 'abcdefghi'); 
    
SELECT *
FROM Users; 

# Create a TRIGGER 

# 1. When updating user's password, if the NEW password is null or empty string then update it back to the OLD password

DROP TRIGGER IF EXISTS UpdatePwdTrigger; 

DELIMITER // 
CREATE TRIGGER UpdatePwdTrigger
BEFORE UPDATE 
ON Users
FOR EACH ROW 
BEGIN 
	IF (NEW.`Password` IS NULL OR NEW.`Password` = '') THEN 
		SET NEW.`Password` = OLD.`Password`; 
    ELSE 
		SET NEW.`Password` = `Password`(NEW.`Password`); 
	END IF; 
END // 
DELIMITER ; 

UPDATE Users 
SET `Password` = ''
WHERE User_ID = 109; 

SELECT * 
FROM Users; 

# Create VIEW that uses 3-4 base tables 

# 1. Display information about the gym, instructors and equipment present in gyms that offer classes longer than 30 minutes 

CREATE VIEW long_classes AS 
SELECT g.Gym_ID, g.Street, g.City, i.Instructor_Name, e.Item_Name, c.Workout_Name, c.Workout_Duration_Minutes 
FROM Gym g 
INNER JOIN Instructors i 
ON g.Gym_ID = i.Gym_ID 
INNER JOIN Equipment e 
ON e.Gym_ID = i.Gym_ID 
INNER JOIN Classes c
ON c.Gym_ID = e.Gym_ID
WHERE c.Workout_Duration_Minutes > 30; 

# Select distinct classes 

SELECT DISTINCT Workout_Name, Workout_Duration_Minutes, City, Street, Item_Name
FROM long_classes;

# Create an EVENT

# 1. Create a table that stores the total monthly revenue of the gym (i.e. members' total paid amount)  
-- Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;
SET GLOBAL event_scheduler = OFF;

CREATE TABLE GymManagement.MonthlyRevenue
(Revenue_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Last_Update TIMESTAMP, 
Total_Revenue FLOAT); 

SELECT * 
FROM MonthlyRevenue; 

DELIMITER // 
CREATE EVENT revenue_so_far 
ON SCHEDULE EVERY 1 MONTH
STARTS '2021-06-01 00:00:00'
DO BEGIN
	DECLARE total FLOAT; 
	SELECT @total := SUM(Amount) FROM GymManagement.Payment;
	INSERT INTO MonthlyRevenue
    (Last_Update, Total_Revenue)
    VALUES
    (NOW(), @total); 
END //
DELIMITER ; 

SELECT * 
FROM MonthlyRevenue; 
DROP EVENT revenue_so_far;
DROP TABLE MonthlyRevenue;
