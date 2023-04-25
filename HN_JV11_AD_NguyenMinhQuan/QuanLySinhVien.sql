create database quanLySinhVien_test2;
use quanLySinhVien_test2;
create table students(
studentId smallint primary key,
studentName varchar(50),
age smallint,
email varchar(50)
);
create table subjects(
subjectId smallint primary key,
subjectName varchar(50)
);
create table marks(
mark int,
studentId smallint,
subjectId smallint
);
create table classes(
classId smallint primary key,
className varchar(50)
);
create table classStudent(
studentId smallint,
classId smallint
);
alter table marks
add foreign key (studentId) references students(studentId);
alter table marks
add foreign key (subjectId) references subjects(subjectId);
alter table classstudent
add foreign key (studentId) references students(studentId);
alter table classstudent
add foreign key (classId) references classes(classId);
insert into students values
(1,"Nguyen Quang An",18,"an@gmail.com"),
(2,"Le Cong Vinh",20,"vinh@gmail.com"),
(3,"Pham Van Quyen",19,"quyen@gmail.com"),
(4,"Nguyen Thanh Binh",25,"binh@gmail.com"),
(5,"Phan Van Tai Em",30,"em@gmail.com");
insert into classes() values
(1,"C0706L"),
(2,"C0708G");
insert into classStudent() values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);
insert into subjects() values
(1,"SQL"),
(2,"JAVA"),
(3,"C"),
(4,"Visual basic");
insert into marks() values 
(8,1,1),
(4,1,2),
(9,1,1),
(7,3,1),
(3,4,1),
(5,5,2),
(8,3,3),
(1,5,3),
(3,4,2);
-- 1. Hien thi danh sach tat ca cac hoc vien
select * from students;
-- 2. Hien thi danh sach tat ca cac mon hoc
select * from subjects;
-- 3. Tinh diem trung binh
select students.studentName, avg(mark) as dtb from
students join marks on students.studentId = marks.studentId
 group by marks.studentId;
 -- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
 select subjects.subjectId,subjects.subjectName,mark from 
 marks join subjects on marks.subjectId = subjects.subjectId where mark =
 (select max(mark) from marks join subjects on marks.subjectId = subjects.subjectId);
 -- 5.. Danh so thu tu cua diem theo chieu giam
 select @stt:=@stt + 1 as STT,subjects.subjectName,mark from
(select @stt:=0)as STT, marks join subjects on marks.subjectId = subjects.subjectId
 order by mark desc;
 -- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table subjects
modify subjectName nvarchar(255);
-- 7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot 
-- SubjectName trong bang Subjects
update subjects
set subjectName = concat("day la mon hoc ",subjectName);
-- 8.. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu 
-- cau Age >15 va Age < 50
alter table students
add constraint check_age check(age between 15 and 50);
-- 9. Loai bo tat ca quan he giua cac bang
alter table marks
drop constraint marks_ibfk_1;
alter table marks
drop constraint marks_ibfk_2;
alter table classStudent
drop constraint classstudent_ibfk_1;
alter table classStudent
drop constraint classstudent_ibfk_2;
-- 10.Xoa hoc vien co StudentID la 1
delete from students
where students.studentId = 1;
-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia
-- tri Default la 1
alter table students
add column status bit default 1 after email;
-- 12.Cap nhap gia tri Status trong bang Student thanh 0
update students set status = 0;







