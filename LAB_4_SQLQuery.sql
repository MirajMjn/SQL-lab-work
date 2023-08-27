USE Advanced;

--to sort employee table in descending order
SELECT * FROM employee
ORDER BY ename DESC;

--to sort name and publication name in ascending order
SELECT [name], publication FROM booklist
ORDER BY [name] ASC;

--to display top 3 records from teacher table
SELECT TOP 3 * FROM teacher;

-- to display sum of all salaries of employee
SELECT SUM(salary) AS Total FROM employee;

--to dsiplay min salary
SELECT MIN(salary) FROM employee;

-- Display the average price of book written by same author
SELECT author, AVG(price) AS average FROM book
GROUP BY author;

-- Display publication name and number of books published 
-- by it from book list relation publication wise.

SELECT publication, COUNT(*) FROM booklist
GROUP BY publication;

-- Display the bid and bname of books whose price is 
-- greater than average prices of book
UPDATE book SET price = 200 WHERE bid = 8;
SELECT * FROM book;

SELECT bid, bname FROM book
WHERE price > (SELECT AVG(price) FROM book);

-- Find the bid , bname and author in ascending order where author name is started by “s”.
SELECT bid, bname, author FROM book
WHERE author LIKE 'J%';

--Find the teacher name and book taken by him. The teacher’s salary who takes the 
--book should be the maximum salary.


--Find the authors name who have written more than one book.
SELECT * FROM book;

SELECT author FROM book
GROUP BY author HAVING COUNT(author) > 1;