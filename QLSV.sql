nes (61 sloc)  3.35 KB

create database quanlysinhvien;
use quanlysinhvien;

create table Class(
                      ClassID int auto_increment primary key,
                      ClassName varchar(10),
                      StartDate date,
                      Status boolean
);
create table Student(
                        StudentID int auto_increment primary key,
                        StudentName varchar(30),
                        Address varchar(50),
                        Phone varchar(12),
                        Status boolean,
                        ClassID int,
                        foreign key (ClassID) references Class (ClassID)
);
create table Subject(
                        SubID int auto_increment primary key,
                        SubName varchar(20),
                        Credit int,
                        Status boolean
);
create table Mark(
                     MarkID int auto_increment primary key,
                     SubID int,
                     StudentID int,
                     Mark int,
                     ExamTimes time,
                     foreign key (SubID) references Subject (SubID),
                     foreign key (StudentID) references  Student (StudentID)
);
insert into Class (ClassName, StartDate, Status) value ('A1', '2021-10-23', true);
insert into Class (ClassName, StartDate, Status) value ('A2', '2020-10-23', true);
insert into Class (ClassName, StartDate, Status) value ('A3', '2019-10-23', false);

insert into Student (StudentName, Address, Phone, Status, ClassID) VALUE ('Tuan','Hai Phong', '012345567', true,1);
insert into Student (StudentName, Address, Phone, Status, ClassID) VALUE ('Thao','Phu Tho', '0123455678', true,1);
insert into Student (StudentName, Address, Phone, Status, ClassID) VALUE ('Duy','Ha Noi', '01234556789', true,2);

insert into Subject (SubName, Credit, Status) VALUE ('Tieng Anh', 5, true);
insert into Subject (SubName, Credit, Status) VALUE ('My Thuat', 6, true);
insert into Subject (SubName, Credit, Status) VALUE ('Am Nhac', 5, true);
insert into Subject (SubName, Credit, Status) VALUE ('Ngu Van', 10, true);

insert into Mark (SubID, StudentID, Mark, ExamTimes) VALUE (1, 1, 8, '01:00');
insert into Mark (SubID, StudentID, Mark, ExamTimes) VALUE (1, 2, 10, '02:00');
insert into Mark (SubID, StudentID, Mark, ExamTimes) VALUE (2, 1, 12, '01:00');

use quanlysinhvien;
select * from Student;
select * from Student where Status = true;
select * from Subject where Credit < 10;
select s.StudentID, s.StudentName, C.ClassName from Student s  join Class C on C.ClassID = s.ClassID;
select s.StudentID, s.StudentName as TenHocSinh, c.ClassName as TenLop from  Student s join Class C on C.ClassID = s.ClassID where ClassName = 'A1';
select s.StudentID, s.StudentName, sub.SubName, m.Mark from student s join Mark M on s.StudentID = M.StudentID join Subject sub on sub.SubID = M.SubID;
select s.StudentID, s.StudentName, sub.SubName, m.Mark from student s join Mark M on s.StudentID = M.StudentID join Subject sub on sub.SubID = M.SubID where Mark > 8;
select s.StudentID, s.StudentName, sub.SubName, m.Mark from student s join Mark M on s.StudentID = M.StudentID join Subject sub on sub.SubID = M.SubID where SubName = 'Tieng Anh';
select * from Student where StudentName like '%T%';
select * from Class where StartDate like '%2021%';
select * from Subject where Credit between 5 and 6;
update Student s set s.ClassID = 2 where s.StudentName like '%Tuan%';
update Student s set s.ClassID = 1 where s.StudentID = 2;
select s.StudentID, s.StudentName, sub.SubName, m.Mark from Student s join Mark M on s.StudentID = M.StudentID join Subject sub on sub.SubID = M.SubID;
select s.StudentID, s.StudentName, sub.SubName, m.Mark from Student s join Mark M on s.StudentID = M.StudentID join Subject sub on sub.SubID = M.SubID order by Mark desc, StudentName;
