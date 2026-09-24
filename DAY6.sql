create database test
use test
CREATE TABLE Patients (PatientID INT PRIMARY KEY AUTO_INCREMENT,PatientName VARCHAR(100) NOT NULL,Age INT,Gender VARCHAR(10),PhoneNumber VARCHAR(15),Email VARCHAR(100),
BloodGroup VARCHAR(5),Address TEXT,Disease VARCHAR(100),DoctorName VARCHAR(100),AdmissionDate DATE,DischargeDate DATE,RoomNumber INT,TreatmentCost DECIMAL(10,2),PaymentStatus VARCHAR(20),
EmergencyContact VARCHAR(15),City VARCHAR(50),StateName VARCHAR(50),Pincode VARCHAR(10),CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Patients
(PatientName, Age, Gender, PhoneNumber, Email, BloodGroup,
Address, Disease, DoctorName, AdmissionDate, DischargeDate,
RoomNumber, TreatmentCost, PaymentStatus, EmergencyContact,
City, StateName, Pincode)

VALUES
('Rahul Kumar',35,'Male','9876543210','rahul1@gmail.com','O+','Chennai','Fever','Dr. Ravi','2026-01-01','2026-01-05',101,15000,'Paid','9876500001','Chennai','Tamil Nadu','600001'),

('Priya Sharma',28,'Female','9876543211','priya2@gmail.com','A+','Tambaram','Dengue','Dr. Meena','2026-01-02',NULL,102,22000,'Pending','9876500002','Chennai','Tamil Nadu','600045'),

('Arun Raj',45,'Male','9876543212','arun3@gmail.com','B+','Pallavaram','Diabetes','Dr. Kumar','2026-01-03',NULL,103,18000,'Paid','9876500003','Chennai','Tamil Nadu','600043'),

('Sneha Devi',31,'Female','9876543213','sneha4@gmail.com','AB+','Velachery','Cold','Dr. John','2026-01-04','2026-01-08',104,8000,'Paid','9876500004','Chennai','Tamil Nadu','600042'),

('Vijay Kumar',52,'Male','9876543214','vijay5@gmail.com','O-','Chromepet','BP','Dr. Ravi','2026-01-05',NULL,105,26000,'Pending','9876500005','Chennai','Tamil Nadu','600044'),

('Kavya R',24,'Female','9876543215','kavya6@gmail.com','A-','Medavakkam','Asthma','Dr. Priya','2026-01-06','2026-01-09',106,12000,'Paid','9876500006','Chennai','Tamil Nadu','600100'),

('Suresh Babu',40,'Male','9876543216','suresh7@gmail.com','B-','Tambaram','Heart Problem','Dr. Kumar','2026-01-07',NULL,107,45000,'Pending','9876500007','Chennai','Tamil Nadu','600045'),

('Anitha M',29,'Female','9876543217','anitha8@gmail.com','AB-','Pallavaram','Fever','Dr. Meena','2026-01-08','2026-01-10',108,9000,'Paid','9876500008','Chennai','Tamil Nadu','600043'),

('Ramesh',38,'Male','9876543218','ramesh9@gmail.com','O+','Guduvanchery','Viral Fever','Dr. John','2026-01-09',NULL,109,13000,'Pending','9876500009','Chennai','Tamil Nadu','603202'),

('Deepika',33,'Female','9876543219','deepika10@gmail.com','A+','Chengalpattu','Diabetes','Dr. Ravi','2026-01-10',NULL,110,17000,'Paid','9876500010','Chennai','Tamil Nadu','603001'),

('Ajith',50,'Male','9876543220','ajith11@gmail.com','B+','Tambaram','BP','Dr. Kumar','2026-01-11','2026-01-15',111,25000,'Paid','9876500011','Chennai','Tamil Nadu','600045'),

('Divya',27,'Female','9876543221','divya12@gmail.com','O+','Velachery','Cold','Dr. Priya','2026-01-12',NULL,112,9500,'Pending','9876500012','Chennai','Tamil Nadu','600042'),

('Karthik',34,'Male','9876543222','karthik13@gmail.com','AB+','Poonamallee','Fever','Dr. Ravi','2026-01-13','2026-01-17',113,14000,'Paid','9876500013','Chennai','Tamil Nadu','600056'),

('Meena',48,'Female','9876543223','meena14@gmail.com','B-','Avadi','Heart Problem','Dr. John','2026-01-14',NULL,114,50000,'Pending','9876500014','Chennai','Tamil Nadu','600054'),

('Hari',30,'Male','9876543224','hari15@gmail.com','A+','Pallikaranai','Dengue','Dr. Meena','2026-01-15',NULL,115,21000,'Paid','9876500015','Chennai','Tamil Nadu','600100');
INSERT INTO Patients
(PatientName, Age, Gender, PhoneNumber, Email, BloodGroup,
Address, Disease, DoctorName, AdmissionDate, DischargeDate,
RoomNumber, TreatmentCost, PaymentStatus, EmergencyContact,
City, StateName, Pincode)

VALUES
('Nisha',26,'Female','9876543225','nisha16@gmail.com','O+','Tambaram','Asthma','Dr. Priya','2026-01-16','2026-01-19',116,11000,'Paid','9876500016','Chennai','Tamil Nadu','600045'),

('Ganesh',44,'Male','9876543226','ganesh17@gmail.com','A+','Chromepet','Diabetes','Dr. Ravi','2026-01-17',NULL,117,23000,'Pending','9876500017','Chennai','Tamil Nadu','600044'),

('Lavanya',32,'Female','9876543227','lavanya18@gmail.com','B+','Pallavaram','Cold','Dr. Meena','2026-01-18','2026-01-21',118,9000,'Paid','9876500018','Chennai','Tamil Nadu','600043'),

('Prakash',39,'Male','9876543228','prakash19@gmail.com','AB+','Velachery','BP','Dr. Kumar','2026-01-19',NULL,119,19000,'Pending','9876500019','Chennai','Tamil Nadu','600042'),

('Swetha',29,'Female','9876543229','swetha20@gmail.com','O-','Guduvanchery','Fever','Dr. John','2026-01-20','2026-01-23',120,12500,'Paid','9876500020','Chennai','Tamil Nadu','603202'),

('Mohan',53,'Male','9876543230','mohan21@gmail.com','A-','Tambaram','Heart Problem','Dr. Ravi','2026-01-21',NULL,121,52000,'Pending','9876500021','Chennai','Tamil Nadu','600045'),

('Keerthana',25,'Female','9876543231','keerthana22@gmail.com','B-','Medavakkam','Dengue','Dr. Meena','2026-01-22',NULL,122,20000,'Paid','9876500022','Chennai','Tamil Nadu','600100'),

('Vignesh',37,'Male','9876543232','vignesh23@gmail.com','AB-','Chengalpattu','Viral Fever','Dr. John','2026-01-23','2026-01-25',123,14000,'Paid','9876500023','Chennai','Tamil Nadu','603001'),

('Aarthi',41,'Female','9876543233','aarthi24@gmail.com','O+','Avadi','BP','Dr. Kumar','2026-01-24',NULL,124,26000,'Pending','9876500024','Chennai','Tamil Nadu','600054'),

('Saravanan',36,'Male','9876543234','saravanan25@gmail.com','A+','Poonamallee','Fever','Dr. Ravi','2026-01-25','2026-01-28',125,15000,'Paid','9876500025','Chennai','Tamil Nadu','600056'),

('Monika',28,'Female','9876543235','monika26@gmail.com','B+','Pallikaranai','Cold','Dr. Priya','2026-01-26',NULL,126,8500,'Pending','9876500026','Chennai','Tamil Nadu','600100'),

('Dinesh',47,'Male','9876543236','dinesh27@gmail.com','O-','Tambaram','Diabetes','Dr. Kumar','2026-01-27',NULL,127,28000,'Paid','9876500027','Chennai','Tamil Nadu','600045'),

('Janani',34,'Female','9876543237','janani28@gmail.com','A+','Chromepet','Asthma','Dr. John','2026-01-28','2026-01-31',128,10000,'Paid','9876500028','Chennai','Tamil Nadu','600044'),

('Ragul',31,'Male','9876543238','ragul29@gmail.com','AB+','Pallavaram','Dengue','Dr. Meena','2026-01-29',NULL,129,24000,'Pending','9876500029','Chennai','Tamil Nadu','600043'),

('Shalini',27,'Female','9876543239','shalini30@gmail.com','B-','Velachery','Fever','Dr. Ravi','2026-01-30','2026-02-02',130,12000,'Paid','9876500030','Chennai','Tamil Nadu','600042');
select * from Patients where TreatmentCost < 20000
select * from Patients where AdmissionDate > "2026-01-10"
select * from patients where PaymentStatus = "Pending"
select * from Patients where Gender="Female"and Age<35 or TreatmentCost >20000
select * from Patients where Gender="Female" and Age> 30
select * from Patients where PatientName like"_____"
Select * from Patients where Disease like "F%"
select * from Patients where Email like"%@gmail.com"
select * from Patients where AdmissionDate between "2026-01-01" and "2026-01-31"
select * from Patients order by TreatmentCost desc limit 1
select count(Gender) from Patients group by Gender
select avg(TreatmentCost) , Disease from Patients group by Disease
select Disease , count(PatientID) as temp from Patients group by Disease having count(PatientID)>5
select Disease , avg(TreatmentCost) as temp from Patients group by Disease having avg(TreatmentCost)>15000
select distinct BloodGroup from patients 
select * from Patients order by TreatmentCost desc limit 3
select * from Patients limit 10 offset 10
select * from patients where Disease = "Fever" or  Disease = "Dengue" or Disease = "BP"