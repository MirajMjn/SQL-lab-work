--LAB 2 : Constraints, Integrity and Where clause.

--In this ab we learn to use constraints in out database.


USE Advanced;

--preliminary------------------------------------------------------------------------------------------------------
--To create another table 'employee' with schema (*eid, ename, dateofemply, salary).

CREATE TABLE employee(
	eid int	NOT NULL,
	ename varchar(20),
	dateofemploy date,
	salary int,

	PRIMARY KEY(eid)
);


CREATE TABLE booklist(
	isbn int NOT NULL,
	[name] varchar(20),
	publication varchar(20),

	PRIMARY KEY(isbn)
);

CREATE TABLE book(
	bid int	NOT NULL,
	bname varchar(20),
	author varchar(20),
	price int,

	PRIMARY KEY(bid)
);

CREATE TABLE issues(
	iid int	NOT NULL,
	[name] varchar(20),
	dateofissue date,

	PRIMARY KEY(iid)
);

-----------------------------------------------------------------------------------------------------------------
--To modify table 'students' and set 'ID' as the primary key.
--And table in 'teacher' make 'TID' as foreign key.

ALTER TABLE student
ALTER COLUMN ID int NOT NULL; 

ALTER TABLE student
ADD PRIMARY KEY(ID);

ALTER TABLE teacher
ALTER COLUMN TID int NOT NULL; 

/*
syntax to make a foreign key.
ALTER TABLE <tablename>
ADD FOREIGN KEY(TID) REFERENCE parent(attribute);
*/

-----------------------------------------------------------------------------------------------------------------

--ADDing a default date for the dateofemploy in employee.
ALTER TABLE employee
DROP CONSTRAINT df_employee_dateofemploy; --drops existing default.

ALTER TABLE employee
ADD CONSTRAINT df_employee_dateofemploy
DEFAULT 'Jan 1, 2010' FOR dateofemploy;

------------------------------------------------------------------------------------------------------------------
--Adding bid and iid as a foreign key.
ALTER TABLE issues
ADD bid int;

ALTER TABLE issues
ADD CONSTRAINT f_k_book_issues
FOREIGN KEY (bid)
REFERENCES book(bid);

ALTER TABLE book
ADD iid int;

ALTER TABLE book
ADD CONSTRAINT f_k_issues_book
FOREIGN KEY (iid)
REFERENCES issues(iid);

------------------------------------------------------------------------------------------------------------------
--Adding a CHECK constraint to make sure that price of book is less than 5000.
ALTER TABLE book
DROP CONSTRAINT ck_book_price; --drops existing constraint.

ALTER TABLE book
ADD CONSTRAINT ck_book_price 
CHECK(price > 0 AND price < 5000);

------------------------------------------------------------------------------------------------------------------
--Creating a constraint, such that the "name" in all the relations are NOT NULL i.e. must have some value.
ALTER TABLE employee
ALTER COLUMN ename varchar(40) NOT NULL;

ALTER TABLE book
ALTER COLUMN bname varchar(40) NOT NULL;

ALTER TABLE booklist
ALTER COLUMN [name] varchar(40) NOT NULL;

ALTER TABLE issues
ALTER COLUMN [name] varchar(40) NOT NULL;

-----------------------------------------------------------------------------------------------------------------
--Inserting 5 entries into each table.

INSERT employee
VALUES	(1, 'Ram Thapa', 'Jan 18, 2011', 10000),
		(2, 'Shyam Paudel', 'May 09, 2013', 17000),
		(3, 'Aryan Shrestha', 'Dec 21, 2010', 20000),
		(4, 'Biplav Karki', 'Mar 16, 2011', 8000),
		(5, 'Samir Awale', 'Feb 18, 2013', 12000);

ALTER TABLE book
ALTER COLUMN bname varchar(90);

INSERT book
VALUES	(1, 'All The Bright Places', 'Jennifer Niven', 200),
		(2, 'The Fault in our Stars', 'John Green', 200),
		(3, 'Half Girlfriend', 'Chetan Bhagat', 100),
		(4, 'The Alchemist', 'Paulo Coelho', 400),
		(5, 'Holding Up The Universe', 'Jennifer Niven', 200);

ALTER TABLE booklist
ALTER COLUMN [name] varchar(90);

INSERT booklist
VALUES	(100117, 'Modern Operating Systems', 'McMillian Press'),
		(202331, 'Principles of Modern Physics', 'Heritage Publication'),
		(440111, 'Engineering Economics', 'Mathura Publication'),
		(009881, 'Filter Design Fundamentals', 'IOE PCampus Press'),
		(988821, 'Basic Mathematics', 'Taleju Publications');

INSERT issues
VALUES	(1, 'Miraj Maharjan', 'June 15, 2023'),
		(2, 'Araj Thapa', 'June 9, 2023'),
		(3, 'Biraj Karki', 'may 10, 2023'),
		(4, 'Kiraj Rai', 'Jan 21, 2023'),
		(5, 'Riraj Paudel', 'Mar 27, 2023');
----------------------------------------------------------------------------------------------------------------
--Retrieving all tables
SELECT * FROM employee;
SELECT * FROM booklist;
SELECT * FROM book;
SELECT * FROM issues;

--__________________________________________--ADDITIONAL WORK--______________________________________________--
--To display the next few outputs we enter some relevant data into tables.

INSERT INTO employee
VALUES	(6, 'Binaya Shah', 'Apr 18, 2014', 8000),
		(7, 'Shova Bista', 'Nov 2, 2012', 12000);

INSERT INTO book(bid, bname, author, price)
VALUES	(6, 'Modern Operating Systems', 'A.S. Tenanbaum', 2700),
		(7, 'Engineering Economics', 'Ishwar Adhikari', 3000);

INSERT booklist
VALUES	(333333, 'Study Techniques', 'Ekta Publication'),
		(232323, 'Principles of Animation', 'E-Ink Publishers');

INSERT issues(iid, [name], dateofissue)
VALUES	(6, 'Raman', 'Dec 27, 2022');

--___________________________________________________________________________________________________________--
----------------------------------------------------------------------------------------------------------------
--Displaying eid and ename of employees with salary less than 10K
SELECT eid, ename FROM employee
WHERE salary < 10000;

----------------------------------------------------------------------------------------------------------------
--Displaying all records of books costing between 2500 and 5000.
SELECT * FROM book
WHERE price BETWEEN 2500 AND 5000;

----------------------------------------------------------------------------------------------------------------
--Displaying all records of booklist whose publication starts with 'E'.
SELECT * FROM booklist
WHERE publication LIKE 'E%';

----------------------------------------------------------------------------------------------------------------
--Displaying all records of employee whose name ends with 'ta'.
SELECT * FROM employee
WHERE ename LIKE '%ta' ;

----------------------------------------------------------------------------------------------------------------
--Displaying iid and name from issues table with names consisting of exactly 5 characters.
SELECT iid, [name] FROM issues
WHERE name LIKE '_____' ;

---------------------------------------------------------------------------------------------------------------
--Displaying all records from employee table with name starting with S and salary greater than 10000.
SELECT * FROM employee
WHERE ename LIKE 'S%' AND salary > 10000;

---------------------------------------------------------------------------------------------------------------
--Displaying all records from book table where either bid is in range 2 to 4 or price range in 400 to 3000.
SELECT * FROM book
WHERE bid between 2 AND 4 OR price BETWEEN 400 AND 3000;

---------------------------------------------------------------------------------------------------------------
--Displaying isbn and bookname where booklist must not contain "23".
SELECT isbn, [name] FROM booklist
WHERE isbn NOT LIKE '%23%';

---------------------------------------------------------------------------------------------------------------
--__________________________________________--ADDITIONAL WORK--______________________________________________--
--UPDATING TID into student table (also adding a salary to teachers)
UPDATE student SET TID = 1
WHERE ID = 1 OR ID = 3;
UPDATE student SET TID = 2
WHERE ID = 5;
UPDATE student SET TID = 4
WHERE ID = 2;
UPDATE student SET TID = 5
WHERE ID = 4;

UPDATE teacher SET salary = 12000
WHERE faculty = 'BCE';
UPDATE teacher SET salary = 32000
WHERE faculty = 'BEI';
UPDATE teacher SET salary = 25000
WHERE faculty = 'BCT';
UPDATE teacher SET salary = 18000
WHERE faculty = 'BEL';

SELECT * FROM student;
SELECT * FROM teacher;

