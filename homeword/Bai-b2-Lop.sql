create table tbl_sinhvien(
	id int,
    maLop int,
    ten varchar(25),
    tuoi int,
    gioiTinh varchar(10)
);
create table tbl_giaovien(
	id int,
    soNamKN int,
    ten varchar(25),
    tuoi int,
    gioiTinh varchar(10)
);
create table tbl_diem(
	id int,
    maSV int, 
    diemToan float, 
    diemLy float, 
    diemHoa float
);

insert into tbl_sinhvien(id, maLop, ten, tuoi, gioiTinh) 
values (1, 1111, "Hà 1", "20","Nam"),
(2, 1111, "Hà 2", "20","Nam"),
(3, 1111, "Hà 3", "20","Nam"),
(4, 1111, "Hà 4", "20","Nam"),
(5, 1111, "Hà 5", "20","Nam"),
(6, 1111, "Hà 6", "20","Nam"),
(7, 1111, "Hà 7", "20","Nam"),
(8, 1111, "Hà 8", "20","Nam"),
(9, 1111, "Hà 9", "20","Nam"),
(10, 1111, "Hà 10", "20","Nam");

insert into tbl_giaovien(id, soNamKN, ten, tuoi, gioiTinh) 
values (1, 5, "Hà 1", "20","Nam"),
(2, 5, "Hà 2", "20","Nam"),
(3, 2, "Hà 3", "20","Nam"),
(4, 5, "Hà 4", "20","Nam"),
(5, 5, "Hà 5", "20","Nam"),
(6, 9, "Hà 6", "20","Nam"),
(7, 5, "Hà 7", "20","Nam"),
(8, 3, "Hà 8", "20","Nam"),
(9, 5, "Hà 9", "20","Nam"),
(10, 3, "Hà 10", "20","Nam");

insert into tbl_diem(id, maSV, diemToan, diemLy, diemHoa)
values (1, 2222, 8.5, 8, 9),
(2, 3333, 9, 8, 9),
(3, 4444, 8, 8, 9),
(4, 5555, 8, 8, 9),
(5, 6666, 7.8, 8, 9),
(6, 7777, 9,8, 9),
(7, 8888, 9, 8, 9),
(8, 9999, 10,8, 9),
(9, 1111, 8.2, 8, 9),
(10, 1234, 9, 8, 9);

select * from tbl_sinhvien;

select * from tbl_giaovien;

select * from tbl_diem;

alter table tbl_diem add trungBinh float;

alter table tbl_diem modify trungBinh double;

SET SQL_SAFE_UPDATES = 0;

update tbl_diem set diemToan = 10, diemLy = 9, diemHoa = 8.5 where id = 1;

alter table tbl_diem drop trungBinh;

delete from tbl_diem WHERE id = 10;