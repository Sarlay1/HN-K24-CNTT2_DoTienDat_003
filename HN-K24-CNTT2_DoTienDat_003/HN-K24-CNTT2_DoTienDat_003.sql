
drop table if exists Patient;
drop table if exists Doctor;
drop table if exists Department;
drop table if exists Appointment;
create table Patient (
	patient_id varchar(50) primary key,	
    patient_full_name varchar (50),
    patient_dob date,
    patient_gender varchar(10),
    patient_phone varchar(15) unique
);
create table Doctor(
	doctor_id varchar(5) primary key,
    doctor_full_name varchar(100),
    doctor_specialty varchar(100),
    doctor_phone varchar(15) unique
);
create table Department(
	department_id varchar(5) primary key, 
    department_name varchar(100) unique, 
    department_location varchar(100)
);
create table Appointment(
	appointment_id int primary key auto_increment,
    patient_id varchar(5),
    doctor_id varchar(5), 
    department_id varchar(5),
    appointment_date date,
    appointment_status varchar(20),
	foreign key (patient_id) references Patient(patient_id),
	foreign key (doctor_id) references Doctor(doctor_id),
	foreign key (department_id) references Department(department_id)
);

insert into Patient (patient_id, patient_full_name, patient_dob, patient_gender, patient_phone) values
('P001', 'Nguyễn Văn An', '1995-03-15', 'Nam', '0912345678'),
('P002', 'Trần Thị Bích', '1998-07-22', 'Nữ', '0923456789'),
('P003', 'Lê Hoàng Minh', '1987-11-05', 'Nam', '0934567890'),
('P004', 'Phạm Thu Hà', '2000-01-18', 'Nữ', '0945678901'),
('P005', 'Võ Quốc Huy', '1992-09-30', 'Nam', '0956789012');
insert into Dotor (doctor_id, doctor_full_name, doctor_specialty, doctor_phone) values
('D001', 'BS. Nguyễn Thanh Tùng', 'Nội khoa', '0901112222'),
('D002', 'BS. Trần Minh Đức', 'Ngoại khoa', '0902223333'),
('D003', 'BS. Lê Thị Lan', 'Nhi khoa', '0903334444'),
('D004', 'BS. Phạm Quốc Bảo', 'Tim mạch', '0904445555'),
('D005', 'BS. Võ Hoàng Yến', 'Da liễu', '0905556666');
insert into Department (department_id, department_name, department_location) values
('DP01', 'Khoa Nội', 'Tầng 1'),
('DP02', 'Khoa Ngoại', 'Tầng 2'),
('DP03', 'Khoa Nhi', 'Tầng 3'),
('DP04', 'Khoa Tim mạch', 'Tầng 4'),
('DP05', 'Khoa Da liễu', 'Tầng 5');
insert into Appointment (appointment_id, patient_id, doctor_id, department_id, appointment_date, appointment_status) values
('1', 'P001', 'D001', 'DP01', '2025-10-01', 'Completed'),
('2', 'P002', 'D002', 'DP03', '2025-10-02', 'Completed'),
('3', 'P003', 'D003', 'DP04', '2025-10-03', 'Pending'),
('4', 'P004', 'D004', 'DP02', '2025-10-04', 'Cancelled'),
('5', 'P005', 'D005', 'DP05', '2025-10-05', 'Completed');

-- 1
update Patient
set patient_phone = '096536868'
where patient_id = 'P003';
-- 2
update Appointment
set appointment_status = 'Cancelled'
where appointment_id = '3';
-- 3 
delete from Appointment 
where appointment_status = 'Cancelled';

-- PHẦN 2
-- 10
select patient_id, patient_full_name from Patient 
limit 2 offset 3;
-- 9
select appointment_status from Appointment 
limit 3;
-- 8
select appointment_id, patient_id, appointment_date from Apointment
order by appointment_date desc;
-- 7
-- 6

select patient_id, patient_full_name, patient_dob, patient_gender, patient_phone from Patient;
select * from appointment;
select patient_full_name, patient_phone, patient_gender from Patient 
where patient_phone = '09';

