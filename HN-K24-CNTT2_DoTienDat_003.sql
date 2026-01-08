drop database if exists hospital_db;
create database hospital_db;
use hospital_db;

drop table if exists appointment;
drop table if exists patient;
drop table if exists doctor;
drop table if exists department;

create table patient (
    patient_id varchar(5) primary key,
    patient_full_name varchar(100) not null,
    patient_dob date not null,
    patient_gender varchar(10) not null,
    patient_phone varchar(15) not null unique
);

create table doctor (
    doctor_id varchar(5) primary key,
    doctor_full_name varchar(100) not null,
    doctor_specialty varchar(100) not null,
    doctor_phone varchar(15) not null unique
);

create table department (
    department_id varchar(5) primary key,
    department_name varchar(100) not null unique,
    department_location varchar(100) not null
);

create table appointment (
    appointment_id int primary key auto_increment,
    patient_id varchar(5) not null,
    doctor_id varchar(5) not null,
    department_id varchar(5) not null,
    appointment_date date not null,
    appointment_status varchar(20) not null,
    foreign key (patient_id) references patient(patient_id),
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (department_id) references department(department_id)
);
INSERT INTO patient VALUES
('P001','Nguyễn Văn An','1995-03-15','Nam','0912345678'),
('P002','Trần Thị Bích','1998-07-22','Nữ','0923456789'),
('P003','Lê Hoàng Minh','1987-11-05','Nam','0934567890'),
('P004','Phạm Thu Hà','2000-01-18','Nữ','0945678901'),
('P005','Võ Quốc Huy','1992-09-30','Nam','0956789012');

INSERT INTO department VALUES
('DP01','Khoa Nội','Tầng 1'),
('DP02','Khoa Ngoại','Tầng 2'),
('DP03','Khoa Nhi','Tầng 3'),
('DP04','Khoa Tim mạch','Tầng 4'),
('DP05','Khoa Da liễu','Tầng 5');

INSERT INTO doctor VALUES
('D001','BS. Nguyễn Thanh Tùng','Nội khoa','0901112222'),
('D002','BS. Trần Minh Đức','Ngoại khoa','0902223333'),
('D003','BS. Lê Thị Lan','Nhi khoa','0903334444'),
('D004','BS. Phạm Quốc Bảo','Tim mạch','0904445555'),
('D005','BS. Võ Hoàng Yến','Da liễu','0905556666');

INSERT INTO appointment (patient_id, doctor_id, department_id, appointment_date, appointment_status) 
VALUES
('P001','D001','DP01','2025-10-01','Completed'),
('P002','D003','DP03','2025-10-02','Completed'),
('P003','D004','DP04','2025-10-03','Pending'),
('P004','D002','DP02','2025-10-04','Cancelled'),
('P005','D005','DP05','2025-10-05','Completed');


-- 3 cập nhật số điện thoại bệnh nhân p003
update patient
set patient_phone = '096536868'
where patient_id = 'P003';
-- 4 huỷ lịch hẹn id = 3
update appointment
set appointment_status = 'Cancelled'
where appointment_id = 3;
-- 5
delete from appointment
where appointment_status = 'Cancelled'
and appointment_date < '2025-10-04';
-- 6
select appointment_id, appointment_date, appointment_status
from appointment
where appointment_status = 'Completed'
and appointment_date > '2025-10-01';
-- 7
select patient_full_name, patient_phone, patient_gender
from patient
where patient_phone like '09%';
-- 8 danh sách lịch hẹn sắp xếp giảm dần
select appointment_id, patient_id, appointment_date
from appointment
order by appointment_date desc;
-- 9 lấy 3 lịch hẹn completed đầu tiên
select *
from appointment
where appointment_status = 'Completed'
limit 3;
-- 10. bỏ 2, lấy 3 bệnh nhân tiếp theo
select patient_id, patient_full_name
from patient
limit 3 offset 2;
-- 11 
select a.appointment_id,
       p.patient_full_name,
       a.doctor_id,
       a.appointment_date
from appointment a
join patient p on a.patient_id = p.patient_id
where a.appointment_status = 'Completed';
-- 12
select d.doctor_id,
       d.doctor_full_name,
       a.appointment_id
from doctor d
left join appointment a on d.doctor_id = a.doctor_id;
-- 13
select appointment_status,
       count(*) as total_appointment
from appointment
group by appointment_status;
-- 14 
-- 15