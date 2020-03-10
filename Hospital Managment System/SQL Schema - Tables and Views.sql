CREATE DATABASE HOSPITAL;
GO

CREATE SCHEMA Hospital;
Go

CREATE TABLE Hospital.Doctor(ID int PRIMARY KEY, Name varchar(20), Degree varchar(20), Born varchar(20));
CREATE TABLE Hospital.Nurse(ID int PRIMARY KEY, Name varchar(20));
CREATE TABLE Hospital.Pharmacist (ID int PRIMARY KEY, Name varchar(20));
CREATE TABLE Hospital.Patient (ID int PRIMARY KEY, Name varchar(20), Disease varchar(20), Doctor_ID int CONSTRAINT FK_Doctor_ID FOREIGN KEY (Doctor_ID)
    REFERENCES Hospital.Doctor(ID) );

CREATE TABLE Hospital.Medication (Med_ID int PRIMARY KEY, Patient_ID int, Name varchar(20), Disease varchar(20), Doctor_ID int, Medicine1 varchar(20),Medicine2 varchar(20), Pharmacist_ID int,CONSTRAINT FK_Med_DoctorID FOREIGN KEY (Doctor_ID)
    REFERENCES Hospital.Doctor(ID), CONSTRAINT FK_Pharmacist_ID FOREIGN KEY (Pharmacist_ID) REFERENCES Hospital.Pharmacist(ID),
	CONSTRAINT FK_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Hospital.Patient(ID));

INSERT INTO Hospital.Doctor(ID, Name, Degree, Born)
VALUES(1,'Doctor1','MD','1967');
INSERT INTO Hospital.Doctor(ID, Name, Degree, Born)
VALUES(2,'Doctor2','MBBS','1987');
INSERT INTO Hospital.Doctor(ID, Name, Degree, Born)
VALUES(3,'Doctor3','MD','1978');
INSERT INTO Hospital.Doctor(ID, Name, Degree, Born)
VALUES(4,'Doctor4','MD','1991');
INSERT INTO Hospital.Doctor(ID, Name, Degree, Born)
VALUES(5,'Doctor5','MD','1980');

INSERT INTO Hospital.Nurse( ID, Name)
VALUES( 1,'Nurse1')
INSERT INTO Hospital.Nurse( ID, Name)
VALUES( 2,'Nurse2')
INSERT INTO Hospital.Nurse( ID, Name)
VALUES( 3,'Nurse3')
INSERT INTO Hospital.Nurse( ID, Name)
VALUES( 4,'Nurse4')
INSERT INTO Hospital.Nurse( ID, Name)
VALUES( 5,'Nurse5')

INSERT INTO Hospital.Pharmacist(ID, Name)
VALUES( 1, 'Pharmacist1')
INSERT INTO Hospital.Pharmacist(ID, Name)
VALUES( 2, 'Pharmacist2')
INSERT INTO Hospital.Pharmacist(ID, Name)
VALUES( 3, 'Pharmacist3')
INSERT INTO Hospital.Pharmacist(ID, Name)
VALUES( 4, 'Pharmacist4')
INSERT INTO Hospital.Pharmacist(ID, Name)
VALUES( 5, 'Pharmacist5')

INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 1, 'Patient1', 'Bronchitis', 1 )
INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 2, 'Patient2', 'Diabetes', 1 )
INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 3, 'Patient3', 'High Fever', 2 )
INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 4, 'Patient4', 'ligament tear', 3 )
INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 5, 'Patient4', 'Fever', 4 )
INSERT INTO Hospital.Patient(ID,Name,Disease,Doctor_ID)
VALUES( 6, 'Patient5', 'Malaria', 5 )

INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1,Medicine2,Pharmacist_ID)
VALUES( 1, 1,'Patient1','Bronchitis', 1, 'Bronchial Soothe', NULL,2)
INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1,Medicine2,Pharmacist_ID)
VALUES( 2, 2,'Patient2','Diabetes', 1, 'Metformin','Glucophage',1)
INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1, Medicine2,Pharmacist_ID)
VALUES( 3, 3,'Patient3','High Fever', 2, 'Aspirin', NULL,3)
INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1, Medicine2,Pharmacist_ID)
VALUES( 4, 4,'Patient4','ligament tear', 3, 'Paracetamol', NULL,4)
INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1, Medicine2,Pharmacist_ID)
VALUES( 5, 4,'Patient4','Fever', 4, 'Aspirin', NULL,3)
INSERT INTO Hospital.Medication(Med_ID, Patient_ID,Name,Disease,Doctor_ID,Medicine1, Medicine2,Pharmacist_ID)
VALUES( 6, 5,'Patient5','Malaria', 5, 'Atovaquone', NULL,5)


CREATE VIEW Hospital.vwMedication 
AS 
SELECT MED_ID, Patient_ID, Medicine1, Medicine2, Doctor_ID 
FROM Hospital.Medication m INNER JOIN Hospital.Pharmacist p ON m.Pharmacist_ID = p.ID WHERE p.Name = USER_NAME();



