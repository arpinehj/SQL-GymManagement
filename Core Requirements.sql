# CORE REQUIREMENTS: JOINS, SUBQUERIES AND FUNCTIONS 

# JOINS 

# 1. What classes are offered in the gyms present in the Greater London area? 
USE GymManagement; 

SELECT c.Workout_Name, c.Workout_Duration_Minutes, c.Workout_Day, c.Description, g.Street, g.City, g.County
FROM Classes c
INNER JOIN 
Gym g 
ON c.Gym_ID = g.Gym_ID
WHERE g.County = 'Greater London'; 

# 2. What gym membership type have people who joined after 2015 purchased? 
SELECT m1.Type_Name, m2.Joining_Date
FROM Membership m1 
INNER JOIN Members m2
ON m1.Membership_ID = m2.Membership_ID
WHERE m2.Joining_Date > '2015-01-01'; 

# 3. How many people were born before 2000 and are senior or student?
SELECT m.`Name`, m.City, m.Date_of_Birth, m2.Type_Name, u.Email as Email, p.Amount as 'Monthly Amount £',
p.Payment_Date
FROM Members m
INNER JOIN 
Membership m2
ON m.User_ID = m2.User_ID
INNER JOIN 
Users u
ON m2.User_ID = u.User_ID
INNER JOIN
Payment p
ON u.User_ID = p.User_ID
WHERE m.Date_of_Birth <= '2000-01-01'
AND m2.Type_Name IN ('Senior', 'Student')
ORDER BY m2.Type_Name;

# 4. Which gyms have equipment and what are their provider names?
SELECT g.Gym_ID, g.City, e.Item_Name, e.Provider
FROM Gym g
INNER JOIN 
Equipment e
ON g.Gym_ID = e.Gym_ID
ORDER BY g.City ASC;

# Create VIEW

# 1. Create a view that shows all information about members who have a 'Student' or 'Senior' membership: 
# Name, Gender, Joining_Date, user, password, membership type, when they last paid 

CREATE VIEW info_members
AS 
SELECT m1.`Name`, m1.Gender, m1.Joining_Date, u.UserName, u.`Password`, m2.Type_Name, p.Payment_Date 
FROM Members m1 
INNER JOIN 
Membership m2
ON m1.Membership_ID = m2.Membership_ID
INNER JOIN 
Users u 
ON m2.User_ID = u.User_ID 
INNER JOIN 
Payment p
ON u.User_ID = p.User_ID 
WHERE m2.Type_Name IN ('Student', 'Senior'); 

SELECT * 
FROM info_members; 

# SUBQUERIES 

# 1. What is the most common gym membership type people who joined after 2015 have purchased? 
SELECT m1.Type_Name, COUNT(m1.Type_Name) AS counts_type
FROM Membership m1
WHERE m1.Membership_ID IN
(SELECT m2.Membership_ID
FROM Members m2 
WHERE m2.Joining_Date > '2015-01-01')
GROUP BY m1.Type_Name
ORDER BY counts_type DESC; 

# FUNCTION

# 1. Create a function that tells if a member has paid for their membership in May 2021
select * from GymManagement.Payment;

DELIMITER $$
CREATE FUNCTION has_paid(Payment_Date DATE) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
	DECLARE paid VARCHAR(20); 
    IF Payment_Date < '2021-04-30' THEN SET paid = 'no'; 
    ELSEIF (Payment_Date > '2021-04-30' AND Payment_Date < '2021-05-31') THEN SET paid = 'yes'; 
    END IF; 
    RETURN (paid); 
END $$
DELIMITER ; 

SELECT Payment_Date, has_paid(Payment_Date) 
FROM Payment;
-- DROP FUNCTION has_paid;