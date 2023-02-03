--******************TRIGGERS********************
-- an action that will be excuted when a particular entry is deleted or entered into the database
--TRIGGERS ARE DEFINED IN THE COMMAND LINE


CREATE TABLE trigger_test(
message VARCHAR(100)
);


DELIMITER $$

CREATE 
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES ('added a new employee');
    END $$

DELIMITER ;



INSERT INTO employee VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM employee;
SELECT * FROM trigger_test;