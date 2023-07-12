USE Advanced;

--to display all the bookname, publication name and author name where publication name is EKTA--

--Additional work
SELECT * FROM book;
SELECT * FROM booklist;

INSERT INTO book (bid, bname, author)
VALUES (8, 'Study Techniques', 'Rammani');

--using join

SELECT book.bname, booklist.publication, book.author 
FROM book INNER JOIN booklist ON book.bname = booklist.[name]
WHERE booklist.publication LIKE 'Ekta%';

--without join

SELECT book.bname, booklist.publication, book.author 
FROM book, booklist
WHERE book.bname = booklist.[name] AND booklist.publication LIKE 'Ekta%';


---------------------------------------------------------------------------------------------

--to find the student name and ID who issued book on 15 jun 2023--

SELECT * FROM issues
SELECT * FROM student

--using join

SELECT student.[name], student.ID 
FROM student INNER JOIN issues ON issues.[name] = student.[name]
WHERE dateofissue = '15 Jun, 2023';

--without join

SELECT student.[name], student.ID 
FROM student, issues
WHERE student.[name] = issues.[name] AND dateofissue = '15 Jun, 2023';

----------------------------------------------------------------------------------------------

--to display employee name whose salary is greater than 10000 and faculty is computer.

--Additional.
INSERT INTO  employee(eid, ename, salary)
VALUES	(10, 'Dhiraj Pyakurel', 20000),
		(20, 'Bikash Acharya', 18000),
		(30, 'Ajaya Shrestha', 18000),
		(40, 'Laxmibhakta Maharjan', 20000),
		(50, 'Rabin Shrestha', 15000);

SELECT * FROM employee;
SELECT * FROM teacher;

--using join
SELECT employee.ename 
FROM employee INNER JOIN teacher ON employee.ename = teacher.[name]
WHERE teacher.faculty = 'BCT';

--without join

SELECT employee.ename 
FROM employee, teacher
WHERE employee.ename = teacher.[name] AND teacher.faculty = 'BCT';

----------------------------------------------------------------------------------------------

--to add attribute bid on issues relation
SELECT * FROM issues;

----------------------------------------------------------------------------------------------

--to insert data into bid column

--Additional work
SELECT * FROM book;
SELECT * FROM issues;

--actual QUERY
UPDATE issues SET bid = 1 
WHERE iid = 1;
UPDATE issues SET bid = 3
WHERE iid = 2;
UPDATE issues SET bid = 5
WHERE iid = 3;
UPDATE issues SET bid = 4
WHERE iid = 4;
UPDATE issues SET bid = 6
WHERE iid = 5;
UPDATE issues SET bid = 2
WHERE iid = 6;

---------------------------------------------------------------------------------------------

--to find the sudent name and book name issues by student whose name starts with M.
SELECT issues.[name], book.bname 
FROM book LEFT JOIN issues ON book.bid = issues.bid
WHERE issues.[name] LIKE 'M%';

---------------------------------------------------------------------------------------------

--to update all salaries by 10 %
ALTER TABLE teacher
DROP COLUMN salary;

SELECT * FROM teacher;
SELECT * FROM employee;

--Actual QUERY
UPDATE employee SET salary = salary * (1.1);

----------------------------------------------------------------------------------------------

--to update book name 