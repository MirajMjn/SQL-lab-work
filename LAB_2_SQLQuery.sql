--LAB 2 : Constraints, Integrity and Where clause.

--In this ab we learn to use constraints in out database.

/*
CONSTRAINTS :
-> NOT NULL
-> DEFAULT
-> UNIQUE
-> PRIMARY key
-> FOREIGN key
-> CHECK 
-> INDEX
*/

USE Advanced;

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
--To create another table 'employee' with schema (*eid, ename, dateofemply, salary).

CREATE TABLE employee(
	eid int	NOT NULL,
	ename varchar(20),
	dateofemploy date,
	salary int,

	PRIMARY KEY(eid)
);
DROP TABLE employee;


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

SELECT * FROM employee;
SELECT * FROM booklist;
SELECT * FROM book;
SELECT * FROM issues;

--ADDing a default date for the dateofemploy in employee.
ALTER TABLE employee
DROP CONSTRAINT df_employee_dateofemploy; --drops existing default.

ALTER TABLE employee
ADD CONSTRAINT df_employee_dateofemploy
DEFAULT 'Jan 1, 2010' FOR dateofemploy;

--Adding a CHECK constraint to make sure that price of book is less than 5000.
ALTER TABLE book
DROP CONSTRAINT ck_book_price; --drops existing constraint.

ALTER TABLE book
ADD CONSTRAINT ck_book_price 
CHECK(price > 0 AND price < 5000);

--ALTER TABLE book
--ADD CONSTRAINT ck_book_price 
--UNIQUE (bid);

--Creating a constraint, such that the "name" in all the relations are NOT NULL i.e. must have some value.
ALTER TABLE employee
ALTER COLUMN ename varchar(40) NOT NULL;

ALTER TABLE book
ALTER COLUMN bname varchar(40) NOT NULL;

ALTER TABLE booklist
ALTER COLUMN [name] varchar(40) NOT NULL;

ALTER TABLE issues
ALTER COLUMN [name] varchar(40) NOT NULL;

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

--Inserting 5 entries into each table.
-------------------------------------------------------------------------------------------------------------------------------------------

INSERT employee
VALUES	(1, 'Ram Thapa', 'Jan 18, 2011', 10000),
		(2, 'Shyam Paudel', 'May 09, 2013', 17000),
		(3, 'Aryan Shrestha', 'Dec 21, 2010', 20000),
		(4, 'Biplav Karki', 'Mar 16, 2011', 8000),
		(5, 'Samir Awale', 'Feb 18, 2013', 12000);
	
SELECT * FROM employee;
-------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE book
ALTER COLUMN bname varchar(90);

INSERT book
VALUES	(1, 'All The Bright Places', 'Jennifer Niven', 200),
		(2, 'The Fault in our Stars', 'John Green', 200),
		(3, 'Half Girlfriend', 'Chetan Bhagat', 100),
		(4, 'The Alchemist', 'Paulo Coelho', 400),
		(5, 'Holding Up The Universe', 'Jennifer Niven', 200);
	
SELECT * FROM book;
delete book;
-------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE booklist
ALTER COLUMN [name] varchar(90);

INSERT booklist
VALUES	(100117, 'Modern Operating Systems', 'McMillian Press'),
		(202331, 'Principles of Modern Physics', 'Heritage Publication'),
		(440111, 'Engineering Economics', 'Mathura Publication'),
		(009881, 'Filter Design Fundamentals', 'IOE PCampus Press'),
		(988821, 'Basic Mathematics', 'Taleju Publications');
	
SELECT * FROM booklist;
delete booklist;
-------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM student;

INSERT issues
VALUES	(1, 'Miraj Maharjan', 'June 15, 2023'),
		(2, 'Araj Thapa', 'June 9, 2023'),
		(3, 'Biraj Karki', 'may 10, 2023'),
		(4, 'Kiraj Rai', 'Jan 21, 2023'),
		(5, 'Riraj Paudel', 'Mar 27, 2023');
	
SELECT * FROM issues;
delete issues;
-------------------------------------------------------------------------------------------------------------------------------------------

--Retrieving all tables
SELECT * FROM employee;
SELECT * FROM booklist;
SELECT * FROM book;
SELECT * FROM issues;

--Displaying eid and ename of employees with salary less than 10K
SELECT * FROM employee
WHERE salary < 15000;

--Displaying all records of books costing between 200 and 500.
SELECT * FROM book
WHERE price ;

--Displaying all records of booklist whose publication starts with 'T'.
SELECT * FROM booklist
WHERE publication ;

--Displaying all records of employee whose name ends with 'ta'.
SELECT * FROM booklist
WHERE publication ;

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

