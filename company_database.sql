--creating a company database

CREATE TABLE employee(
emp_id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR(40),
last_name VARCHAR(40),
birth_day DATE,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT,
PRIMARY KEY (emp_id)
);

CREATE TABLE branch(
    branch_id INT AUTO_INCREMENT NOT NULL,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    PRIMARY KEY (branch_id),
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);


--code to set up a foreign key outside the table
--a little bit long 


ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;


ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;



--creating the client table

CREATE TABLE client (
client_id INT AUTO_INCREMENT NOT NULL,
client_name VARCHAR(40),
PRIMARY KEY (client_id),
branch_id INT, 
FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);


CREATE TABLE works_with(
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY (emp_id, client_id),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);


CREATE TABLE branch_suppliers(
  branch_id INT NOT NULL,
  supplier_name VARCHAR(40),
  PRIMARY KEY (branch_id, supplier_name),
  FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


INSERT INTO employee VALUES (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);


INSERT INTO branch VALUES (1, 'Corporate', 100, '2020-02-09');


UPDATE employee
set branch_id = 1
WHERE emp_id = 100;



INSERT INTO employee VALUES (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
INSERT INTO employee VALUES (102, 'Micheal', 'Scott', '1964-03-15', 'M', 75000, 101, NULL);


INSERT INTO employee VALUES (103, 'Angela', 'Martin', '1971-06-25', 'F', 75000, 102, 2);
INSERT INTO employee VALUES (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 75000, 102, 2);
INSERT INTO employee VALUES (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 75000, 102, 2);
INSERT INTO employee VALUES (106, 'Josh', 'Porter', '1969-09-05', 'M', 75000, 100, 3);
INSERT INTO employee VALUES (107, 'Andy', 'Bernard', '1973-07-22', 'M', 75000, 106, 3);
INSERT INTO employee VALUES (108, 'Jim', 'Halpert', '1978-10-01', 'M', 75000, 106, 3);


INSERT INTO branch VALUES (2, 'Scranton', 102, '1992-04-06');
INSERT INTO branch VALUES (3, 'Stamford', NULL, '1998-02-13');


UPDATE  branch
SET mgr_id = 106
WHERE branch_id = 3;



SELECT * FROM employee;
SELECT * FROM branch;


UPDATE  employee
SET branch_id = 2
WHERE emp_id = 102;



SELECT * FROM client;

INSERT INTO client VALUES (400, 'Dunmore HighSchool', 2);
INSERT INTO client VALUES (401, 'Lackawna County', 2);
INSERT INTO client VALUES (402, 'FedEx', 3);
INSERT INTO client VALUES (403, 'John Daily Law,LLC', 3);
INSERT INTO client VALUES (404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES (405, 'Times Newspaper', 3);
INSERT INTO client VALUES (406, 'FedEx', 2);


SELECT * FROM works_with;

INSERT INTO works_with VALUES (105, 400, 55000);
INSERT INTO works_with VALUES (102, 401, 267000);
INSERT INTO works_with VALUES (108, 402, 22500);
INSERT INTO works_with VALUES (107, 403, 5000);
INSERT INTO works_with VALUES (108, 403, 12000);
INSERT INTO works_with VALUES (105, 404, 33000);
INSERT INTO works_with VALUES (107, 405, 26000);
INSERT INTO works_with VALUES (102, 406, 15000);
INSERT INTO works_with VALUES (105, 406, 130000);


SELECT * FROM branch_suppliers;

ALTER TABLE branch_suppliers
ADD supply_type VARCHAR(40);


INSERT INTO branch_suppliers VALUES (2, 'Hammer Mill','Paper');
INSERT INTO branch_suppliers VALUES (2, 'Uni-ball','Writing Utensils');
INSERT INTO branch_suppliers VALUES (3, 'Patriot Paper','Paper');
INSERT INTO branch_suppliers VALUES (2, 'J.T Forms & Labels','Custom Forms');
INSERT INTO branch_suppliers VALUES (3, 'Uni-ball','Writing Utensils');
INSERT INTO branch_suppliers VALUES (3, 'Hammer Mill','Paper');
INSERT INTO branch_suppliers VALUES (3, 'Stamford Labels','Custom Forms');


--find all employees ordered by salary

SELECT * FROM employee
ORDER BY salary;

--find all employees ordered by sex and name(fullname)
SELECT * FROM employee
ORDER BY sex, first_name, last_name; 

--change the name of the columns returned by using the AS KEYWORD

SELECT first_name AS forename, last_name AS surname
FROM employee;

--FIND OUT ALL THE DIFFERENT GENDERS
--returns all unique values

SELECT DISTINCT sex
FROM employee;

SELECT DISTINCT first_name
FROM employee;


--SQL FUNCTIONS
--find the number of employees
SELECT COUNT(emp_id) FROM employee;

--how many employess have supervisor
SELECT COUNT(super_id) FROM employee;


--count females born after 1970

SELECT * FROM employee;

SELECT COUNT(emp_id) 
FROM employee
WHERE sex = 'F' AND birth_day > '1970-01-01';


--average of all salaries

SELECT AVG(salary)
FROM employee
WHERE sex = 'M';


--find sum of all salries
SELECT SUM(salary)
FROM employee;


--aggregation -> use function to display data
SELECT COUNT(SEX), sex
FROM employee
GROUP BY sex;


--find out the total sales of each employee

SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;


--wildcards -> LIKE keyword

SELECT * FROM client;

-- % -> ANY NUMBER OF CHARACTERS
-- _ -> ONE CHARACTER


--select clients who are an LLC
SELECT client_name
FROM client
WHERE client_name LIKE '%LLC';



SELECT * FROM branch_suppliers;

--Find any branch suppliers who are in the label business

SELECT *
FROM branch_suppliers
WHERE supplier_name LIKE '%Labels';

--find any employee born in october
SELECT first_name, last_name 
FROM employee
WHERE birth_day LIKE '____-10%';



SELECT first_name, last_name 
FROM employee
WHERE birth_day LIKE '%10%';

SELECT * FROM employee;


-- FIND CLIENTS WHO ARE SCHOOLS
SELECT *
FROM client
WHERE client_name LIKE '%School';

-- ***********UNIONS IN SQL***********************
-- COMBINE THE RESULTS OF MULTIPLE SELECT STATEMENTS INTO ONE
--IN ORDER TO GET A UNION
--WE NEED TO HAVE THE SAME NUMBER OF COLUMNS FROM EACH SELECT STATEMENT
--AND THE DATA TYPE OF EACH COLUMN MUST BE THE SAME

--FIND A LIST OF ALL EMPLOYEES AND THE BRANCH NAME
SELECT first_name AS Company_Names
FROM employee
UNION
SELECT branch_name 
FROM branch
UNION
SELECT client_name
FROM client;


--find the list of all money spend or earned by the company'
SELECT SUM(salary) 
FROM employee
UNION
SELECT SUM(total_sales)
FROM works_with;

--*******************JOINS************************
-- JOINS -> used to combine rows from two or more columns based on a related column between them
-- used when we want to combine the results of two or more tables


INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL);

SELECT * FROM branch;

--find all branches and the name of their managers


-- 4 TYPES OF JOINS
-- THIS IS A TYPE OF INNER JOIN
--INNER JOIN RETURNS THE ROWS WITH THE COMMON VALUES
SELECT employee.emp_id, employee.first_name AS Managers, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;


--in a left join we include all of the rows from the left table
SELECT employee.emp_id, employee.first_name AS Managers, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;


--in a RIGHT join we include all of the rows from the RIGHT table
SELECT employee.emp_id, employee.first_name AS Managers, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;


--*****************NESTED QUERIES*****************
-- MULTIPLE SELECT STATEMENTS TO GET A SPECFIC PIECE OF INFORMATION

--FIND ALL EMPLOYEES WHO HAVE SOLD OVER 30,000 TO A SINGLE CLIENT


SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales > 30000
);



--FIND ALL THE CLIENTS WHO ARE HANDLED BY THE BRANCH THAT MICHAEL SCOTT MANAGES
-- ASSUMMING WE KNOW MICHEALS ID

SELECT client.client_name 
FROM client
WHERE client.branch_id IN (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
);

SELECT * FROM client;



--deleting entries in the data basee when they have foreign keys associated to them
--ON DELETE CASCADE -> if the associated foreign key gets deleted, then delete the entire row
--ON DELETE SET NULL -> if the associated foreign key gets deleted, then set that cell to null

--delete a row/micheal scott from the database
DELETE FROM employee
WHERE emp_id = 102;


SELECT * from employee;
SELECT * from branch;


--deleting a branch and checking the cascading results in branch_suppliers
-- aprimary key cant have a null value


DELETE FROM branch
WHERE branch_id = 2;


SELECT * from branch_suppliers;