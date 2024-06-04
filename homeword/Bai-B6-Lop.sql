create table Students(
	student_id int Primary Key,
	student_name varchar(50),
	student_age int
);
create table Courses(
	course_id int Primary Key,
	course_name varchar(50),
	course_description varchar(255)
);
create table Enrollments(
	enrollment_id int Primary Key,
	student_id int,
	course_id int,
	foreign key (student_id) references Students(student_id),
	foreign key (course_id) references Courses(course_id)
);

Insert into students(student_id, student_name, student_age)
values (1, "Hà", 20),
(2, "Hoàng", 19),
(3, "Nhung", 18),
(4, "Anh", 25),
(5, "Lan", 21);

Insert into courses(course_id, course_name, course_description) 
values (1, "java", "mô tả 1"),
(2, "sql", 'mô tả 2'), 
(3, "php", 'mô tả 3'), 
(4, "fontend", 'mô tả 4'), 
(5, "nodejs", 'mô tả 5');

Insert into Enrollments (enrollment_id, student_id, course_id) 
values (1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 3),
(5, 3, 4);

-- 1 Lấy danh sách tất cả sinh viên và thông tin khóa học mà họ đã đăng ký.
select students.student_id, students.student_name, courses.course_id, courses.course_name, courses.course_description
from enrollments
inner join students on enrollments.student_id = students.student_id
inner join courses on enrollments.course_id = courses.course_id;

-- 2 Lấy tên của tất cả các khóa học mà một sinh viên cụ thể đã đăng ký (sử dụng tham số student_id).
select courses.course_name
from enrollments
inner join courses on enrollments.course_id = courses.course_id
where enrollments.student_id = 1;

-- 3 Lấy danh sách tất cả sinh viên và số lượng khóa học mà họ đã đăng ký.
select students.student_name, count(enrollments.course_id) as SLKhoaHoc
from students
left join enrollments on students.student_id = enrollments.student_id
group by students.student_id, students.student_name;

-- 4 Lấy tất cả các khóa học mà chưa có sinh viên nào đăng ký.
select courses.course_name, students.student_name
from courses
left join enrollments on courses.course_id = enrollments.course_id
left join students on students.student_id = enrollments.course_id
where students.student_name is null;

-- 5 Lấy tất cả sinh viên và thông tin khóa học mà họ đã đăng ký, sắp xếp theo tên sinh viên và tên khóa học.
select students.student_name, courses.course_name, courses.course_description
from enrollments
inner join students on enrollments.student_id = students.student_id
inner join courses on enrollments.course_id = courses.course_id
order by students.student_name and courses.course_name;

-- 6 Lấy tất cả các sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có).
select students.student_name, students.student_age, courses.course_name
from students
left join enrollments on students.student_id = enrollments.student_id
left join courses on enrollments.course_id = courses.course_id;

-- 7 Lấy danh sách tất cả sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có). Sắp xếp theo tên sinh viên và tuổi từ cao xuống thấp.
select students.student_name, students.student_age, courses.course_name
from students
left join enrollments on students.student_id = enrollments.student_id
left join courses on enrollments.course_id = courses.course_id
order by students.student_name, students.student_age desc;

-- 8 Lấy tất cả các khóa học và số lượng sinh viên đã đăng ký vào mỗi khóa học.
select courses.course_name, COUNT(Enrollments.student_id) as soLuong
from courses
left join enrollments on courses.course_id = enrollments.course_id
group by courses.course_id, courses.course_name;