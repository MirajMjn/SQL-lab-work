-- introduction to joins and creating views.

USE Advanced;

--Perform join operation on teacher and employee table and display the Ename , Faculty and salary.SELECT employee.ename, teacher.faculty, employee.ename FROM employee INNER JOIN teacher ON employee.ename = teacher.[name];-- Perform left join on table book list and book tableSELECT * FROM booklist LEFT JOIN book ON booklist.[name] = book.bname;-- Perform right join on booklist and book tableSELECT * FROM booklist RIGHT JOIN book ON booklist.[name] = book.bname;-- Perform Full join on student and issues table.SELECT * FROM student FULL JOIN issues ON student.name = issues.[name];--Display those employees name and salary whose name starts with s and whose name consist 
--ni as sub string.CREATE VIEW new_view ASSELECT ename, salary FROM employeeWHERE ename LIKE 'd%ir%';SELECT * FROM new_view;--Display name of the employee who is also a teacher.SELECT employee.ename FROM employeeWHERE employee.ename in (SELECT teacher.[name] FROM teacher);SELECT ename FROM teacher INNER JOIN employee ON ename = teacher.[name];SELECT ename FROM employeeINTERSECTSELECT [name] FROM teacher;--Display all employees name except the name who are teachersSELECT ename FROM teacher INNER JOIN employee ON ename != teacher.[name];SELECT ename FROM employeeEXCEPTSELECT [name] FROM teacher;--Create a view Employee-view which consist of eid, ename , salary as attributesCREATE VIEW employee_view ASSELECT eid, ename, salary FROM employee;SELECT * FROM employee_view;-- Insert an new record in recently created view. And also display the contents of primary table.INSERT INTO employee_view VALUES (21, 'testing thapa', 12000);SELECT * FROM employee_view;SELECT * FROM employee;--Delete the information from view where salary are less than 15000DELETE FROM employee_view WHERE salary < 15000;SELECT * FROM employee_view;