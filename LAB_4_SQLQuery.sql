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
SELECT SUM(salary) FROM employee;

--to dsiplay min salary
SELECT MIN(salary) FROM employee;

-- 6
SELECT author, AVG(price) AS average FROM book
GROUP BY author;

-- 7
SELECT publication, COUNT(*) FROM booklist
GROUP BY publication;
