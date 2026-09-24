#DELIMITER &&
#CREATE TRIGGER demo
#AFTER INSERT ON TABLE1
#FOR EACH ROW 
#BEGIN
#INSERT INTO TABLE2 (regid,name,salary) VALUES (new.regid,new.name,new.salary)
#END
#&&
#DELIMITER;
#INSERT/UPDATE -> new
#DELETE -> old#

-- Create Database
CREATE DATABASE trigger_demo;
USE trigger_demo;


-- Create Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);


-- Insert Employee Values
INSERT INTO employee VALUES
(1, 'Arun', 30000),
(2, 'Kumar', 35000),
(3, 'Ravi', 40000);


-- Create Employee Log Table
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(50),
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- AFTER INSERT Trigger
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(emp_id, emp_name, action)
    VALUES(NEW.emp_id, NEW.emp_name, 'Employee Added');
END //

DELIMITER ;


-- Test AFTER INSERT Trigger
INSERT INTO employee VALUES (4, 'Suresh', 45000);

SELECT * FROM employee;
SELECT * FROM employee_log;


-- BEFORE INSERT Trigger
DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;


-- Test BEFORE INSERT Trigger
INSERT INTO employee VALUES (5, 'Vijay', -5000);

SELECT * FROM employee;


-- Create Salary Log Table
CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- AFTER UPDATE Trigger
DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log(emp_id, old_salary, new_salary)
        VALUES(NEW.emp_id, OLD.salary, NEW.salary);
    END IF;
END //

DELIMITER ;


-- Test AFTER UPDATE Trigger
UPDATE employee
SET salary = 50000
WHERE emp_id = 1;

SELECT * FROM employee;
SELECT * FROM salary_log;


-- Create Deleted Employee Log Table
CREATE TABLE deleted_employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(50),
    deleted_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- AFTER DELETE Trigger
DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employee_log(emp_id, emp_name)
    VALUES(OLD.emp_id, OLD.emp_name);
END //

DELIMITER ;


-- Test AFTER DELETE Trigger
DELETE FROM employee
WHERE emp_id = 5;

SELECT * FROM employee;
SELECT * FROM deleted_employee_log;


-- Show All Triggers
SHOW TRIGGERS;


-- Drop Trigger Example
-- DROP TRIGGER after_employee_insert;