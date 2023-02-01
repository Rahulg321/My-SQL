SELECT * FROM student;

--Basic Queries -> getting specific pieces of informations
SELECT NAME from student;

SELECT name, major from student;

--in ascending order by default 
SELECT name, major from student
ORDER BY name;

SELECT name, major from student
ORDER BY name DESC;

SELECT * FROM student
ORDER BY name DESC;

--two or more attributes in descending order
SELECT * FROM student
ORDER BY name, major DESC;

--limiting the numbert of results we get back
SELECT * FROM student
LIMIT 2;

SELECT * FROM student
ORDER BY student_id DESC
LIMIT 2;

--FILTERING DATA
-- <> not equals to (operator)

SELECT * FROM student
WHERE major <> 'science';

--check from a bunch of values if they are present
SELECT * FROM student
WHERE name IN ('Kate', 'nick', 'middleton') AND student_id > 2;


 


--Creating A DATABASE 




