# Group Project: Gym Management System 
CREATE DATABASE GymManagement;
USE GymManagement;

# Table 1: Members
CREATE TABLE GymManagement.Members (
	`Member_ID` INT NOT NULL PRIMARY KEY,
    `Name` VARCHAR(20) NOT NULL,
    `City` VARCHAR(50),
    `Phone_Number` VARCHAR(55) NOT NULL,
    `Email` VARCHAR(55) NOT NULL,
    `Date_of_Birth` DATE NOT NULL,
    `Gender` VARCHAR(10),
    `Joining_Date` DATE NOT NULL,
    `Membership_ID` INT NOT NULL,
    `User_ID` INT NOT NULL
);

INSERT INTO Members
(Member_ID, `Name`, City, Phone_Number, Email, Date_of_Birth, Gender, Joining_Date, Membership_ID, User_ID)
VALUES
(1, 'Ann Devon', 'London', 020-555-94702, 'a.devon@gmail.com', '1986-03-08', 'female', '2016-01-01', 134926, 101),
(2, 'Thomas Hardy', 'London', 020-555-65353, 'thomashardy@gmail.com', '1952-08-13', 'male', '2013-03-01', 834902, 102),
(3, 'Simon Crowther', 'Manchester', 0161-555-2845, 's.crowther@yahoo.com', '1972-10-20', 'male', '2018-02-01', 238574, 103),
(4, 'Laura Lopez', 'Brighton', 01273-555-728, 'lauralopez@gmail.com', '1998-03-12', 'female', '2016-03-01', 569028, 104),
(5, 'Charlotte Gutierrez', 'Manchester', 0161-555-6063, 'charlotte.g@gmail.com', '1953-02-27', 'female', '2019-01-01', 902331, 105),
(6, 'Samantha Bowers', 'Bristol', 0117-555-3491, 'samanthabowers@gmail.com', '1998-05-15', 'female', '2019-03-01', 234958, 106),
(7, 'Jack Clark', 'Sheffield', 0114-555-7225, 'jackc91@yahoo.com', '1991-09-19', 'male', '2011-09-01', 765432, 107),
(8, 'Sean Williams', 'Brighton', 01273-555-8347, 'seanwilliams@yahoo.co.uk', '2000-07-01', 'male', '2019-09-01', 482093, 108),
(9, 'Alisha Kabaria', 'Leicester', 0116-555-9236, 'alishakabaria@gmail.com', '1968-04-14', 'female', '2017-01-01', 935894, 109),
(10, 'Nadia Cox', 'Bournemouth', 1202-555-610, 'nadiacox83@yahoo.co.uk', '1983-06-12', 'female', '2014-02-01', 791456, 110),
(11, 'Danielle Miller', 'London', 020-555-79617, 'danielle.miller@gmail.com', '1989-11-17', 'female', '2016-04-01', 934847, 111),
(12, 'Gabriel Adams', 'Birmingham', 0121-555-629384, 'gabriel.adams@yahoo.co.uk', '1975-09-29', 'male', '2016-01-01', 719294, 112),
(13, 'Jess Bailey', 'Liverpool', 0151-555-3587, 'jessbailey@gmail.com', '1992-04-12', 'female', '2017-09-01', 908765, 113),
(14, 'Cameron Langdon', 'Bristol', 0117-555-8418, 'c.langdon@yahoo.com', '1958-01-22', 'male', '2018-04-01', 799236, 114),
(15, 'Nicole Rivera', 'Croydon', 020-555-38502, 'nicolerivera@gmail.com', '1994-06-25', 'female', '2019-06-01', 863279, 115);

ALTER TABLE Members
DROP COLUMN Phone_Number;

ALTER TABLE Members
ADD `Phone_Number` VARCHAR(55) NOT NULL;

UPDATE Members
SET Phone_Number = '020-555-94702'
WHERE Member_ID = 1;

UPDATE Members
SET Phone_Number = '020-555-65353'
WHERE Member_ID = 2;

UPDATE Members
SET Phone_Number = '0161-555-2845'
WHERE Member_ID = 3;

UPDATE Members
SET Phone_Number = '01273-555-728'
WHERE Member_ID = 4;

UPDATE Members
SET Phone_Number = '0161-555-6063'
WHERE Member_ID = 5;

UPDATE Members
SET Phone_Number = '0117-555-3491'
WHERE Member_ID = 6;

UPDATE Members
SET Phone_Number = '0114-555-7225'
WHERE Member_ID = 7;

UPDATE Members
SET Phone_Number = '01273-555-8347'
WHERE Member_ID = 8;

UPDATE Members
SET Phone_Number = '0116-555-9236'
WHERE Member_ID = 9;

UPDATE Members
SET Phone_Number = '1202-555-610'
WHERE Member_ID = 10;

UPDATE Members
SET Phone_Number = '020-555-79617'
WHERE Member_ID = 11;

UPDATE Members
SET Phone_Number = '0121-555-629384'
WHERE Member_ID = 12;

UPDATE Members
SET Phone_Number = '0151-555-3587'
WHERE Member_ID = 13;

UPDATE Members
SET Phone_Number = '0117-555-8418'
WHERE Member_ID = 14;

UPDATE Members
SET Phone_Number = '020-555-38502'
WHERE Member_ID = 15;


SELECT * FROM GymManagement.Members;

# Table 2: Membership 
CREATE TABLE GymManagement.Membership (
	`Membership_ID` INT NOT NULL PRIMARY KEY,
	`Type_ID` INT NOT NULL,
    `Type_Name` VARCHAR(25) NOT NULL,
    `Period_Start` DATE NOT NULL,
    `Period_End` DATE NOT NULL,
    `Monthly_Amount` FLOAT,
    `Signup_Fee` FLOAT,
    `User_ID` INT NOT NULL
);

INSERT INTO Membership
(Membership_ID, Type_ID, Type_Name, Period_Start, Period_End, Monthly_Amount, Signup_Fee, User_ID)
VALUES
(134926, 1012, 'Unlimited', '2021-01-01', '2022-01-01', 25.00, 20.00, 101),
(834902, 1022, 'Senior', '2021-02-01', '2021-06-01', 20.00, 10.00, 102),
(238574, 1032, 'Unlimited', '2021-01-01', '2021-02-01', 25.00, 20.00, 103),
(569028, 1042, 'Student', '2021-03-01', '2021-07-01', 20.00, 0, 104),
(902331, 1052, 'Senior', '2021-02-01', '2021-08-01', 20.00, 10.00, 105),
(234958, 1062, 'Student', '2021-03-01', '2021-06-01', 20.00, 0, 106),
(765432, 1072, 'Student', '2021-04-01', '2021-09-01', 20.00, 0, 107),
(482093, 1082, 'Student', '2021-02-01', '2021-05-01', 20.00, 0, 108),
(935894, 1092, 'Swimming', '2021-03-01', '2021-06-01', 25.00, 20.00, 109),
(791456, 1102, 'Unlimited', '2021-01-01', '2022-01-01', 25.00, 20.00, 110),
(934847, 1112, 'Unlimited', '2021-01-01', '2022-01-01', 25.00, 20.00, 111),
(719294, 1122, 'Swimming', '2021-04-01', '2021-08-01', 25.00, 20.00, 112),
(908765, 1132, 'Student', '2021-06-01', '2021-09-01', 20.00, 0, 113),
(799236, 1142, 'Senior', '2021-05-01', '2021-10-01', 20.00, 10, 114),
(863279, 1152, 'Unlimited', '2021-01-01', '2022-01-01', 25.00, 20.00, 115);

# Link Members to Membership table via Membership_ID column 
ALTER TABLE Members
ADD CONSTRAINT fk_membership_id 
FOREIGN KEY (Membership_ID) 
REFERENCES Membership (Membership_ID); 

# Table 3: Users 
CREATE TABLE GymManagement.`Users` (
	`User_ID` INT NOT NULL PRIMARY KEY,
    `fullName` VARCHAR(30),
    `Email` VARCHAR(55) NOT NULL,
    `Username` VARCHAR(25) NOT NULL,
    `Password` VARCHAR(25) NOT NULL
);

INSERT INTO `Users`
(User_ID, fullName, Email, Username, `Password`)
VALUES
(101, 'Ann Devon', 'a.devon@gmail.com', 'aand', 'a5816'),
(102, 'Thomas Hardy', 'thomashardy@gmail.com', 'thomash', 'a9623'),
(103, 'Simon Crowther', 's.crowther@yahoo.com', 'simonc', 'b7029'),
(104, 'Laura Lopez', 'lauralopez@gmail.com', 'laural', 'cc4524'),
(105, 'Charlotte Gutierrez', 'charlotte.g@gmail.com', 'charlotteg', 'dv1295'),
(106, 'Samantha Bowers', 'samanthabowers@gmail.com', 'samanthab', 'fd8419'),
(107, 'Jack Clark', 'jackc91@yahoo.com', 'jackc', 'lsl5396'),
(108, 'Sean Williams', 'seanwilliams@yahoo.co.uk', 'seanw', 'ls3627'),
(109, 'Alisha Kabaria', 'alishakabaria@gmail.com', 'alishak', '9610ss'),
(110, 'Nadia Cox', 'nadiacox83@yahoo.co.uk', 'nadiac', '6105sa'),
(111, 'Danielle Miller', 'danielle.miller@gmail.com', 'daniellem', '3882as'),
(112, 'Gabriel Adams', 'gabriel.adams@yahoo.co.uk', 'gabriela', '43fg51'),
(113, 'Jess Bailey', 'jessbailey@gmail.com', 'jessb', 'fla8624'),
(114, 'Cameron Langdon', 'c.langdon@yahoo.com', 'cameronl', '1ssff728'),
(115, 'Nicole Rivera', 'nicolerivera@gmail.com', 'nicoler', 'lkd6851');

# Link Users to Members and Membership tables via User_ID 
ALTER TABLE Members
ADD CONSTRAINT fk_user_id
FOREIGN KEY (User_ID)
REFERENCES Users (User_ID);

ALTER TABLE Membership 
ADD CONSTRAINT fk_user_id2
FOREIGN KEY (User_ID)
REFERENCES Users (User_ID); 

# Table 4: Payment 

CREATE TABLE GymManagement.Payment (
	`Payment_ID` INT NOT NULL PRIMARY KEY,
    `Member_ID` INT NOT NULL,
    `Amount` FLOAT,
    `Payment_Date` DATE,
    `User_ID` INT NOT NULL
);

INSERT INTO Payment
(Payment_ID, Member_ID, Amount, Payment_Date, User_ID)
VALUES
(1001, 1, 25.00, '2021-04-01', 101),
(1002, 2, 20.00, '2021-06-01', 102),
(1003, 3, 25.00, '2021-06-01', 103),
(1004, 4, 20.00, '2021-06-01', 104),
(1005, 5, 20.00, '2021-06-01', 105),
(1006, 6, 20.00, '2021-06-01', 106),
(1007, 7, 20.00, '2021-06-01', 107),
(1008, 8, 20.00, '2021-05-31', 108),
(1009, 9, 25.00, '2021-05-31', 109),
(1010, 10, 25.00, '2021-05-31', 110),
(1011, 11, 25.00, '2021-05-31', 111),
(1012, 12, 25.00, '2021-05-30', 112),
(1013, 13, 20.00, '2021-05-30', 113),
(1014, 14, 20.00, '2021-05-30', 114),
(1015, 15, 25.00, '2021-05-30', 115);

# Create link between Payment table and Members and Users tables via Member_ID and User_ID columns 

ALTER TABLE Payment 
ADD CONSTRAINT fk_member_id
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

ALTER TABLE Payment
ADD CONSTRAINT fk_user_id_pay
FOREIGN KEY (User_ID)
REFERENCES Users (User_ID); 

# Table 5: Classes

CREATE TABLE GymManagement.Classes (
	`Workout_ID` INT NOT NULL PRIMARY KEY,
    `Workout_Name` VARCHAR(25),
    `Workout_Duration_Minutes` INT NOT NULL,
    `Workout_Day` VARCHAR(100),
    `Description` VARCHAR(300),
    `Gym_ID` INT NOT NULL,
    `Instructor_ID` INT NOT NULL
);

INSERT INTO Classes
(Workout_ID, Workout_Name, Workout_Duration_Minutes, Workout_Day, `Description`, Gym_ID, Instructor_ID)
VALUES
(5305, 'Pump', 45, 'Monday, Wednesday, Sunday', 
'100% weighted workout. Low-medium weights, high reps. All choreographed to music. A total body workout.', 
7000001, 501),
(5306, 'Attack', 45, 'Wednesday, Friday', 
'A high energy fitness class with moves that cater for total beginners to total addicts. 
It combines athletic movements like running, lunging and jumping with strength exercises such as push-ups and squats.', 
70000014, 502),
(5307, 'Zumba', 45, 'Monday, Wednesday, Saturday', 
'Lose yourself in Salsa and Latin beats while you dance away calories to achieve a more toned and sleek you.', 
7000009, 503),
(5308, 'Spin', 45, 'Monday, Tuesday, Wednesday, Thursday, Saturday, Sunday', 
'Indoor cycling class with invigorating music and visualization coming together to make this workout both 
fun and effective.', 
7000009, 504),
(5309, 'Yoga', 60, 'Monday, Thursday, Sunday', 
'Increase flexibility, muscle strength and tone while releasing stress.', 
7000001, 505),
(5310, 'Pilates', 60, 'Monday, Tuesday, Thursday', 
'Pilates helps improve posture, muscle tone, balance and joint mobility, as well as relieve stress and tension.', 
7000006, 506),
(5311, 'HIIT', 30, 'Thursday, Friday', 
'HIIT class is a total body, heart pumping, aerobic and strength conditioning workout.', 
7000003, 507),
(5312, 'Aqua Aerobics', 45, 'Tuesday, Wednesday, Sunday', 
'All the benefits of land based exercises with the added support and resistance water provides.', 
7000004, 508),
(5313, 'Body Conditioning', 45, 'Wednesday, Friday', 
'Tone up and trim down with this predominantly resistance based class.', 
7000006, 509),
(5314, 'Circuit', 45, 'Thursday, Saturday', 
'Session set out in stations each of which works a different muscles group to challenges your total body 
while improving your strength.', 
7000012, 510),
(5315, 'Kettlecise', 45, 'Tuesday, Thursday', 
'The single most effective Kettlebell fat burning workout designed to shape and sculpt your body in as little 
as 20 mins for rapid fat loss & a lean toned body.', 
7000010, 511);

# Table 6: Instructors 

CREATE TABLE GymManagement.Instructors (
	`Instructor_ID` INT NOT NULL PRIMARY KEY,
    `Instructor_Name` VARCHAR(45),
    `Phone_Number` VARCHAR(55) NOT NULL,
    `City` VARCHAR(25),
    `Email` VARCHAR(55) NOT NULL,
    `User_ID` INT NOT NULL,
    `Gym_ID` INT NOT NULL
);

INSERT INTO Instructors
(Instructor_ID, Instructor_Name, Phone_Number, City, Email, User_ID, Gym_ID)
VALUES
(501, 'James Blake', 07-555-212938, 'Liverpool', 'jamesblake@gmail.com', 201, 7000001),
(502, 'Tony Lopez', 07-555-639573, 'London', 'tony.lopez1@gmail.com', 202, 70000014),
(503, 'Christian Manti', 07-555-295628, 'Croydon', 'christian@gmail.com', 203, 7000009),
(504, 'Veronica Dessen', 07-555-129537, 'London', 'veronicadessen@gmail.com', 204, 7000009),
(505, 'Jennifer Roth', 07-555-677281, 'Brighton', 'jenniferroth@gmail.com', 205, 7000001),
(506, 'Sarah Williams', 07-555-394857, 'Birmingham', 'sarahwilliams@gmail.com', 206, 7000006),
(507, 'Oliver Kay', 07-555-283764, 'Bristol', 'oliverkay1@gmail.com', 207, 7000003),
(508, 'Ben Edwards', 07-555-803516, 'Bournemouth', 'benedwards@outlook.com', 208, 7000004),
(509, 'Amanda Woods', 07-555-8177731, 'London', 'amanda-woods@gmail.com', 209, 7000006),
(510, 'Amy Matthews', 07-555-756219, 'Manchester', 'amymatthews@outlook.com', 210, 7000012),
(511, 'Thomas Smith', 07-555-188294, 'Brighton', 'thomassmith34@gmail.com', 211, 7000010),
(512, 'Brian Morrison', 07-555-596172, 'Bristol', 'brianmorrison@gmail.com', 212, 7000004),
(513, 'Lily Glover', 07-555-993787, 'Sheffield', 'lilyglover@outlook.co.uk', 213, 7000010),
(514, 'Maria Quinn', 07-555-431998, 'Leicester', 'maria.quinn@gmail.com', 214, 7000008),
(515, 'Joey Walker', 07-555-394811, 'Manchester', 'joeywalker@gmail.com', 215, 70000014);

# User_ID actually does not make sense in the Instructors table, so remove it 
ALTER TABLE Instructors
DROP COLUMN User_ID; 

ALTER TABLE Instructors
DROP COLUMN Phone_Number;

ALTER TABLE Instructors
ADD `Phone_Number` VARCHAR(55) NOT NULL;

UPDATE Instructors
SET Phone_Number = '07-555-212938'
WHERE Instructor_ID = 501;

UPDATE Instructors
SET Phone_Number = '07-555-639573'
WHERE Instructor_ID = 502;

UPDATE Instructors
SET Phone_Number = '07-555-295628'
WHERE Instructor_ID = 503;

UPDATE Instructors
SET Phone_Number = '07-555-129537'
WHERE Instructor_ID = 504;

UPDATE Instructors
SET Phone_Number = '07-555-677281'
WHERE Instructor_ID = 505;

UPDATE Instructors
SET Phone_Number = '07-555-394857'
WHERE Instructor_ID = 506;

UPDATE Instructors
SET Phone_Number = '07-555-283764'
WHERE Instructor_ID = 507;

UPDATE Instructors
SET Phone_Number = '07-555-803516'
WHERE Instructor_ID = 508;

UPDATE Instructors
SET Phone_Number = '07-555-8177731'
WHERE Instructor_ID = 509;

UPDATE Instructors
SET Phone_Number = '07-555-756219'
WHERE Instructor_ID = 510;

UPDATE Instructors
SET Phone_Number = '07-555-188294'
WHERE Instructor_ID = 511;

UPDATE Instructors
SET Phone_Number = '07-555-596172'
WHERE Instructor_ID = 512;

UPDATE Instructors
SET Phone_Number = '07-555-993787'
WHERE Instructor_ID = 513;

UPDATE Instructors
SET Phone_Number = '07-555-431998'
WHERE Instructor_ID = 514;

UPDATE Instructors
SET Phone_Number = '07-555-394811'
WHERE Instructor_ID = 515;

SELECT * FROM GymManagement.Instructors;

# Link Instructors table to Classes table via Instructor_ID column 

ALTER TABLE Classes
ADD CONSTRAINT fk_instructor_id
FOREIGN KEY (Instructor_ID)
REFERENCES Instructors (Instructor_ID); 

# Table 7: Gym

CREATE TABLE GymManagement.Gym (
	`Gym_ID` INT NOT NULL PRIMARY KEY,
    `Street` VARCHAR(30) NOT NULL,
    `City` VARCHAR(30),
    `County` VARCHAR(25),
    `Opening_Hours` VARCHAR(15)
);

INSERT INTO Gym
(Gym_ID, Street, City, County, Opening_Hours)
VALUES
(7000001, '157 Hills Road', 'Liverpool', 'Merseyside', '6:00-22:00'),
(7000002, '32 Downing Street', 'London', 'Greater London', '5:00-23:00'),
(7000003, '21 Mill Lane', 'Croydon', 'Surrey', '7:00-22:00'),
(7000004, '20 Chesterton Road', 'London', 'Greater London', '5:00-22:00'),
(7000005, '150 Union Land', 'Brighton', 'Sussex', '6:00-22:00'),
(7000006, '10 Cherry Hinton Road', 'Birmingham', 'West Midlands', '7:00-22:00'),
(7000007, '12 Hampton Street', 'Bristol', 'Gloucestershire', '6:00-22:00'),
(7000008, '45 Parkside Lane', 'Bournemouth', 'Dorset', '6:00-22:00'),
(7000009, '34 Victoria Street', 'London', 'Greater London', '5:00-22:00'),
(7000010, '20 Earl Street', 'Manchester', 'Greater Manchester', '7:00-23:00'),
(7000011, '43 Cross Street', 'Brighton', 'Sussex', '7:00-22:00'),
(7000012, '25 Devonshire Road', 'Bristol', 'Gloucestershire', '6:00-22:00'),
(70000013, '123 Rustad Road', 'Sheffield', 'Yorkshire', '7:00-22:00'),
(70000014, '2 Neville Road', 'Leicester', 'Leicestershire', '7:00-22:00'),
(70000015, '87 Queen Edith Way', 'Manchester', 'Greater Manchester', '6:00-22:00');

# Link Gym table to Instructors and Classes tables via Gym_ID 
ALTER TABLE Instructors 
ADD CONSTRAINT fk_gym_id_ins
FOREIGN KEY (Gym_ID)
REFERENCES Gym (Gym_ID); 

ALTER TABLE Classes
ADD CONSTRAINT fk_gym_id_clas
FOREIGN KEY (Gym_ID)
REFERENCES Gym (Gym_ID); 

# Table 8: Equipment

CREATE TABLE GymManagement.Equipment (
	`Item_ID` INT NOT NULL PRIMARY KEY,
    `Item_Name` VARCHAR(25),
    `Provider` VARCHAR(30),
    `Cost` FLOAT,
    `Gym_ID` INT NOT NULL
);

INSERT INTO Equipment
(Item_ID, Item_Name, Provider, Cost, Gym_ID)
VALUES
(8365097, 'Treadmill', 'Powerhouse', 1500.00, 7000008),
(7489642, 'Stationary Bike', 'HomeGym', 800.00, 7000006),
(4806421, 'Pullup Bar', 'HomeGym', 2000.00, 7000012),
(3851963, 'Elliptical Trainer', 'HomeGym', 1800.00, 70000014),
(6296437, 'Step Mill', 'Powerhouse', 700.00, 7000003),
(7651092, 'Stationary Rowing Machine', 'FitYou', 850.00, 7000012),
(9274108, 'Recumbent Stationary Bike', 'HomeGym', 680.00, 7000010),
(6541848, 'Cable Crossover Machine', 'HomeGym', 2500.00, 7000003),
(7659284, 'Cable Row Machine', 'FitYou', 1500.00, 7000009),
(2957937, 'Ab Crunch Machine', 'HomeGym', 2200.50, 70000014),
(4858193, 'Leg Curl Machine', 'FitYou', 1700.99, 7000008);

# Link Equipment table to Gym table via Gym_ID column 
ALTER TABLE Equipment
ADD CONSTRAINT fk_gym_id_eq
FOREIGN KEY (Gym_ID)
REFERENCES Gym (Gym_ID); 

SELECT * FROM GymManagement.Members;
SELECT * FROM GymManagement.Membership;
SELECT * FROM GymManagement.Users;
SELECT * FROM GymManagement.Payment;
SELECT * FROM GymManagement.Classes;
SELECT * FROM GymManagement.Instructors;
SELECT * FROM GymManagement.Gym;
SELECT * FROM GymManagement.Equipment;