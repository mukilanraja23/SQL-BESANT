create database john
use john
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    ManagerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Marketing'),
(50, 'Sales'),
(60, 'Operations'),
(70, 'Research');
INSERT INTO Employees
(EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate, ManagerID)
VALUES
(1, 'Arun', 'Kumar', 10, 75000, '2024-03-15', NULL),
(2, 'Anitha', 'Raj', 10, 65000, '2025-01-10', 1),
(3, 'Bala', 'Krishnan', 10, 55000, '2025-02-20', 1),
(4, 'Ajay', 'Kumar', 10, 85000, '2025-04-12', 1),
(5, 'Deepak', 'Raj', 10, 62000, '2025-06-18', 1),
(6, 'Divya', 'Sharma', 10, 48000, '2024-07-22', 1),

(7, 'Karthik', 'Ravi', 20, 58000, '2025-01-25', NULL),
(8, 'Asha', 'Devi', 20, 72000, '2025-03-14', 7),
(9, 'Arun', 'Kumar', 20, 72000, '2025-05-19', 7),
(10, 'Priya', 'Raj', 20, 45000, '2025-08-10', 7),

(11, 'Ramesh', 'Babu', 30, 90000, '2024-02-15', NULL),
(12, 'Anand', 'Kumar', 30, 68000, '2025-02-11', 11),
(13, 'Meena', 'Ravi', 30, 52000, '2025-04-05', 11),
(14, 'Suresh', 'Kumar', 30, 61000, '2025-07-08', 11),

(15, 'Vijay', 'Raj', 40, 55000, '2025-01-05', NULL),
(16, 'Aarthi', 'Kumar', 40, 63000, '2025-09-15', 15),
(17, 'Manoj', 'Das', 40, 47000, '2024-11-20', 15),

(18, 'Rahul', 'Sharma', 50, 80000, '2025-03-10', NULL),
(19, 'Akash', 'Raj', 50, 59000, '2025-05-22', 18),
(20, 'Anu', 'Devi', 50, 42000, '2025-10-12', 18);
