CREATE DATABASE College;
USE College;

CREATE TABLE employee(
	dateofemploy date,
);


ALTER TABLE employee
ADD CONSTRAINT default_dateofemploy
DEFAULT 'Jan 1, 2000' FOR dateofemploy;

CREATE TABLE student(
	sid int,
	sname varchar(40),
	faculty varchar(4)

	CONSTRAINT primary_key_student
	UNIQUE (sid)
);

CREATE TABLE score(
	sid int,
	score int

	CONSTRAINT link_score_to_student
	FOREIGN KEY (sid) 
	REFERENCES student(sid)
);

SELECT * FROM score
WHERE ALL(score>12, sid BETWEEN 2 AND 8);