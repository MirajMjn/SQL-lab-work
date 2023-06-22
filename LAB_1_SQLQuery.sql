-- Creating and Using database "Advanced"
CREATE DATABASE Advanced;
USE Advanced;

--Creating the student and teacher tables based on given Schema.
CREATE TABLE student(
	ID int,
	[name] varchar(20),
	rn int,
	batch int
);

CREATE TABLE teacher(
	TID int,
	[name] varchar(20),
	faculty varchar(20)
);

--Checking creation of the tables
SELECT * FROM student;
SELECT * FROM teacher;

--Inserting records into the tables crested.
INSERT  student
VALUES	(1, 'Miraj Maharjan', 21, 077),
		(2, 'Araj Thapa', 23, 077),
		(3, 'Braj Karki', 25, 077),
		(4, 'Kiraj Rai', 27, 077),
		(5, 'Riraj Paudel', 30, 077);

INSERT INTO  teacher(TID, [name], faculty)
VALUES	(1, 'Dhiraj Pyakurel', 'BEI'),
		(2, 'Bikash Acharya', 'BCT'),
		(3, 'Ajaya Shrestha', 'BCT'),
		(4, 'Laxmibhakta Maharjan', 'BCE'),
		(5, 'Rabin Shrestha', 'BEL');

--Displaying the tables		
SELECT * FROM student;
SELECT * FROM teacher;

--Displaying specific fields		
SELECT ID, [name] FROM student;
SELECT [name], faculty FROM teacher;

--Altering the tables
ALTER TABLE student
DROP COLUMN rn;

ALTER TABLE teacher
ADD salary int;

--Adding a column TID in student then 
ALTER TABLE student
ADD TID int;

ALTER TABLE teacher
ALTER COLUMN TID int NOT NULL;

ALTER TABLE teacher
ADD CONSTRAINT p_k
PRIMARY KEY (TID);

ALTER TABLE student
ADD CONSTRAINT f_k
FOREIGN KEY (TID)
REFERENCES teacher(TID);

--Creating a new table info_student using pre-existing attributes of student
SELECT ID, [name] INTO info_student FROM student;
SELECT * FROM info_student;

--Deleting all contents of info_student
DELETE info_student;