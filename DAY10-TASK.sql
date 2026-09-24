CREATE DATABASE day10;
USE day10;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
);
CREATE TABLE Complaint_Status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);
CREATE TABLE Complaint_Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department_id INT,
    phone VARCHAR(15),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    category_id INT,
    complaint_title VARCHAR(200),
    complaint_description TEXT,
    complaint_date DATE,
    status_id INT,

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (category_id)
        REFERENCES Complaint_Categories(category_id),

    FOREIGN KEY (status_id)
        REFERENCES Complaint_Status(status_id)
);
CREATE TABLE Complaint_Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    complaint_id INT,
    employee_id INT,
    assigned_date DATE,
    resolution_date DATE,

    FOREIGN KEY (complaint_id)
        REFERENCES Complaints(complaint_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
);
INSERT INTO Departments(department_name) VALUES
('Water Supply'),
('Electricity'),
('Road Maintenance'),
('Sanitation'),
('IT Support');
INSERT INTO Users
(user_name, email, phone, address)
VALUES
('Arun','arun@gmail.com','9876543210','Chennai'),
('Priya','priya@gmail.com','9876543211','Madurai'),
('Kumar','kumar@gmail.com','9876543212','Salem'),
('Divya','divya@gmail.com','9876543213','Erode'),
('Suresh','suresh@gmail.com','9876543214','Coimbatore'),
('Rani','rani@gmail.com','9876543215','Trichy'),
('Vijay','vijay@gmail.com','9876543216','Chennai'),
('Meena','meena@gmail.com','9876543217','Vellore'),
('Ajith','ajith@gmail.com','9876543218','Thanjavur'),
('Karthik','karthik@gmail.com','9876543219','Tirunelveli');
INSERT INTO Complaint_Status(status_name) VALUES
('Pending'),
('In Progress'),
('Resolved'),
('Rejected');
INSERT INTO Complaint_Categories
(category_name, department_id)
VALUES
('Water Leakage',1),
('Power Failure',2),
('Road Damage',3),
('Garbage Collection',4),
('System Error',5);
INSERT INTO Employees
(employee_name, department_id, phone)
VALUES
('Ramesh',1,'9000000001'),
('Mahesh',2,'9000000002'),
('Lokesh',3,'9000000003'),
('Ganesh',4,'9000000004'),
('Dinesh',5,'9000000005');
INSERT INTO Complaints
(
    user_id,
    category_id,
    complaint_title,
    complaint_description,
    complaint_date,
    status_id
)
VALUES
(1,1,'Pipe Leakage',
 'Water leakage near street',
 '2025-01-01',1),

(2,2,'No Power',
 'Power cut issue',
 '2025-01-02',2),

(3,3,'Road Crack',
 'Road damaged badly',
 '2025-01-03',3),

(4,4,'Garbage Overflow',
 'Garbage not collected',
 '2025-01-04',1),

(5,5,'Software Issue',
 'Application not working',
 '2025-01-05',2),

(6,1,'Water Problem',
 'No water supply',
 '2025-01-06',3),

(7,2,'Transformer Fault',
 'Transformer damaged',
 '2025-01-07',1),

(8,3,'Potholes',
 'Road potholes issue',
 '2025-01-08',2),

(9,4,'Waste Collection Delay',
 'Garbage issue',
 '2025-01-09',3),

(10,5,'Login Error',
 'Unable to login',
 '2025-01-10',1),

(1,2,'Voltage Fluctuation',
 'Voltage issue',
 '2025-01-11',2);
INSERT INTO Complaint_Assignments
(
    complaint_id,
    employee_id,
    assigned_date,
    resolution_date
)
VALUES
(1,1,'2025-01-01','2025-01-03'),
(2,2,'2025-01-02',NULL),
(3,3,'2025-01-03','2025-01-05'),
(4,4,'2025-01-04',NULL),
(5,5,'2025-01-05',NULL),
(6,1,'2025-01-06','2025-01-08'),
(7,2,'2025-01-07',NULL),
(8,3,'2025-01-08',NULL),
(9,4,'2025-01-09','2025-01-11'),
(10,5,'2025-01-10',NULL);
select c.*, u.user_name, cc.category_name, d.department_name, cs.status_name from complaints c join users u on c.user_id = u.user_id join complaint_categories cc on c.category_id = cc.category_id join departments d on cc.department_id = d.department_id join complaint_status cs on c.status_id = cs.status_id
select e.employee_name, count(ca.complaint_id) as complaint_count from employees e join complaint_assignments ca on e.employee_id = ca.employee_id group by e.employee_id, e.employee_name order by complaint_count desc limit 1
select u.user_name, count(c.complaint_id) as complaint_count from users u join complaints c on u.user_id = c.user_id group by u.user_id, u.user_name order by complaint_count desc limit 3
select month(complaint_date) as month, count(*) as complaint_count from complaints group by month(complaint_date)
select u.user_name from users u join complaints c on u.user_id = c.user_id group by u.user_id, u.user_name having sum(c.status_id = 3)
select c.* from complaints c left join complaint_assignments ca on c.complaint_id = ca.complaint_id where ca.employee_id is null;
select d.department_name, count(c.complaint_id) as complaint_count from departments d join complaint_categories cc on d.department_id = cc.department_id join complaints c on cc.category_id = c.category_id group by d.department_id, d.department_name order by complaint_count desc limit 1;
select e.employee_name, avg(datediff(ca.resolution_date, ca.assigned_date)) as average_days from employees e join complaint_assignments ca on e.employee_id = ca.employee_id where ca.resolution_date is not null group by e.employee_id, e.employee_name;
select e.employee_name, count(ca.complaint_id) as complaint_count from employees e join complaint_assignments ca on e.employee_id = ca.employee_id group by e.employee_id, e.employee_name order by complaint_count desc limit 1;
-- 10 terla chat gpt use  
select d.department_name, count(case when c.status_id = 3 then 1 end) * 100.0 / count(c.complaint_id) as resolution_rate from departments d join complaint_categories cc on d.department_id = cc.department_id join complaints c on cc.category_id = c.category_id group by d.department_id, d.department_name order by resolution_rate desc limit 1;
-- 11 terla chat gpt use
select e.employee_name, count(c.complaint_id) as resolved_count from employees e join complaint_assignments ca on e.employee_id = ca.employee_id join complaints c on ca.complaint_id = c.complaint_id where c.status_id = 3 group by e.employee_id, e.employee_name having count(c.complaint_id) > (select avg(resolved_count) from (select count(c2.complaint_id) as resolved_count from employees e2 join complaint_assignments ca2 on e2.employee_id = ca2.employee_id join complaints c2 on ca2.complaint_id = c2.complaint_id where c2.status_id = 3 group by e2.employee_id) x);
select cc.category_name, count(c.complaint_id) as complaint_count from complaint_categories cc join complaints c on cc.category_id = c.category_id group by cc.category_id, cc.category_name order by complaint_count desc limit 1;
select c.*, datediff(ca.resolution_date, ca.assigned_date) as resolution_days from complaints c join complaint_assignments ca on c.complaint_id = ca.complaint_id where ca.resolution_date is not null and datediff(ca.resolution_date, ca.assigned_date) <= 2;
select e.employee_name, count(c.complaint_id) as pending_count from employees e join complaint_assignments ca on e.employee_id = ca.employee_id join complaints c on ca.complaint_id = c.complaint_id where c.status_id = 1 group by e.employee_id, e.employee_name order by pending_count desc limit 1;
select d.department_name, count(c.complaint_id) as complaint_count from departments d join complaint_categories cc on d.department_id = cc.department_id join complaints c on cc.category_id = c.category_id group by d.department_id, d.department_name order by complaint_count desc limit 3;
select d.department_name, count(c.complaint_id) as complaint_count, count(c.complaint_id) * 100.0 / (select count(*) from complaints) as percentage from departments d join complaint_categories cc on d.department_id = cc.department_id join complaints c on cc.category_id = c.category_id group by d.department_id, d.department_name having percentage > 30;
select c.*, datediff(curdate(), c.complaint_date) as unresolved_days from complaints c where c.status_id = 1 order by unresolved_days desc limit 1;
