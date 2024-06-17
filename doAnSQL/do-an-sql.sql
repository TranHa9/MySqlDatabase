-- Tạo database
CREATE SCHEMA `qlbanhang` ;

use qlbanhang;

-- tạo bảng người dùng
create table user(
	user_id int primary key,
    name varchar(50),
    email varchar(50),
    password varchar(50),
    gender enum('Nam', 'Nữ', 'Khác'),
    birth_day date,
    address varchar(255),
    role enum('admin', 'Quản lý', 'Nhân viên')
);

-- tạo bảng nhà cung cấp
create table provider(
	provider_id int primary key,
    name varchar(50),
    address varchar(255),
	phone varchar(11)
);

-- tạo bảng thể loại
create table categories(
	category_id int primary key,
    name  varchar(50)
);

create table product(
	product_id int primary key,
    name varchar(50),
    price float,
    category_id int,
    image varchar(50),
    description text,
    foreign key (category_id) references categories(category_id)
);

-- tạo bảng khách hàng
create table customer(
	customer_id int primary key,
    name varchar(50),
    address varchar(255),
    phone varchar(11),
    points int -- tích điểm
);

-- tạo bảng hóa đơn
create table bill(
	bill_id int primary key,
    user_id int,
    customer_id int,
    sale_date date, -- ngày lập hóa đơn
    pointsUsed int, -- điểm muốn dùng
    total_money float, -- tổng tiền
    foreign key (user_id) references user(user_id),
    foreign key (customer_id) references customer(customer_id)
);

-- tạo bảng chi tiết hóa đơn
create table bill_product(
	bill_id int,
    product_id int,
    unit_price float, -- đơn giá
    discount float, -- giảm giá
    into_money float, -- thành tiền
    foreign key (bill_id) references bill(bill_id),
    foreign key (product_id) references product(product_id)
);

-- bảng tồn kho
create table inventory (
    inventory_id int primary key,
    product_id int,
    quantity int,
    foreign key (product_id) references product(product_id)
);

-- bảng phiếu nhập kho
create table inventory_provider (
    provider_id int,
    product_id int,
    input_quantity int,
    import_price float,
    provider_date date, -- ngày nhập
    foreign key (provider_id) references provider(provider_id),
    foreign key (product_id) references product(product_id)
);

-- thêm dữ liệu vào các bảng
insert into user (user_id, name, email, password, gender, birth_day, address, role) 
values (1, 'Nguyễn Văn A', 'nguyenvana@gmail.com', 'password123', 'Nam', '1990-05-15', 'Hà Nội', 'admin'),
(2, 'Trần Thị B', 'tranthib@gmail.com', 'password123', 'Nữ', '1985-09-20', 'Hồ Chí Minh', 'Quản lý'),
(3, 'Lê Đình C', 'ledinhc@gmail.com', 'password123', 'Nam', '1995-03-10', 'Đà Nẵng', 'Nhân viên'),
(4, 'Phạm Thị D', 'phamthid@gmail.com', 'password123', 'Nữ', '1992-11-25', 'Hải Phòng', 'Nhân viên'),
(5, 'Hoàng Văn E', 'hoangvane@gmail.com', 'password123', 'Nam', '1988-07-18', 'Cần Thơ', 'Nhân viên'),
(6, 'Trịnh Hương F', 'trinhhuongf@gmail.com', 'password123', 'Nữ', '1997-04-30', 'Nha Trang', 'Nhân viên'),
(7, 'Nguyễn Minh G', 'nguyenminhg@gmail.com', 'password123', 'Nam', '1993-08-05', 'Bình Dương', 'Nhân viên'),
(8, 'Lý Thị H', 'lythih@gmail.com', 'password123', 'Nữ', '1991-02-14', 'Vũng Tàu', 'Nhân viên'),
(9, 'Đỗ Văn I', 'dovani@gmail.com', 'password123', 'Nam', '1989-10-22', 'Long An', 'Nhân viên'),
(10, 'Bùi Thị K', 'buithik@gmail.com', 'password123', 'Nữ', '1996-06-07', 'Thanh Hóa', 'Nhân viên');

insert into provider (provider_id, name, address, phone) values
(1, 'Công ty TNHH A', 'Hà Nội', '0123456789'),
(2, 'Công ty TNHH B', 'Hồ Chí Minh', '0987654321'),
(3, 'Công ty TNHH C', 'Đà Nẵng', '0369852147'),
(4, 'Công ty TNHH D', 'Nha Trang', '0321654987'),
(5, 'Công ty TNHH E', 'Vũng Tàu', '0192837465'),
(6, 'Công ty TNHH F', 'Cần Thơ', '0574829136'),
(7, 'Công ty TNHH G', 'Đà Lạt', '0246813579'),
(8, 'Công ty TNHH H', 'Hải Phòng', '0852963741'),
(9, 'Công ty TNHH I', 'Bình Dương', '0316245789'),
(10, 'Công ty TNHH K', 'Long An', '0968574123');

insert into categories (category_id, name) values
(1, 'Thực phẩm'),
(2, 'Đồ uống'),
(3, 'Hóa phẩm'),
(4, 'Điện tử'),
(5, 'Thời trang'),
(6, 'Dụng cụ học tập'),
(7, 'Đồ chơi'),
(8, 'Mẹ và bé'),
(9, 'Phụ kiện điện thoại'),
(10, 'Đồ gia dụng');

insert into product (product_id, name, price, category_id, image, description) values
(1, 'Nước ngọt Coca-Cola', 15000, 2, 'cocacola.jpg', 'Nước ngọt Coca-Cola lon 330ml'),
(2, 'Bánh mì sandwich', 10000, 1, 'banhmi.jpg', 'Bánh mì sandwich cá ngừ'),
(3, 'Dầu gội Head & Shoulders', 50000, 3, 'headshoulders.jpg', 'Dầu gội chống gàu'),
(4, 'Quần jean nam', 250000, 5, 'jean.jpg', 'Quần jean nam dáng slim'),
(5, 'Áo sơ mi nữ', 200000, 5,'aosomei.jpg', 'Áo sơ mi nữ họa tiết hoa'),
(6, 'Đèn LED Philips', 150000, 4, 'denled.jpg', 'Đèn LED chiếu sáng màu trắng'),
(7, 'Nước suối Lavie', 10000, 2,'lavie.jpg', 'Nước suối Lavie 500ml'),
(8, 'Xà phòng Lifebuoy', 20000, 3,'lifebuoy.jpg', 'Xà phòng diệt khuẩn'),
(9, 'Bánh quy Oreo', 25000, 1, 'oreo.jpg', 'Bánh quy kem sữa Oreo'),
(10, 'Áo thun nam', 150000, 5, 'aothun.jpg', 'Áo thun nam cotton 100%');

insert into customer (customer_id, name, address, phone, points) values
(1, 'Phạm Thị D', '123 Ngõ X, Hà Nội', '0987654321', 50),
(2, 'Nguyễn Văn E', '456 Ngõ Y, Hồ Chí Minh', '0123456789', 30),
(3, 'Trần Đình F', '789 Ngõ Z, Đà Nẵng', '0369852147', 20),
(4, 'Hoàng Thị G', '101 Ngõ T, Hải Phòng', '0321654987', 40),
(5, 'Lê Văn H', '333 Ngõ L, Vũng Tàu', '0192837465', 25),
(6, 'Trịnh Thị I', '555 Ngõ M, Cần Thơ', '0574829136', 35),
(7, 'Đỗ Minh K', '777 Ngõ N, Đà Lạt', '0246813579', 60),
(8, 'Nguyễn Thanh L', '888 Ngõ P, Bình Dương', '0852963741', 45),
(9, 'Bùi Văn M', '999 Ngõ Q, Long An', '0316245789', 55),
(10, 'Phạm Đình N', '111 Ngõ R, Thanh Hóa', '0968574123', 70);

insert into bill (bill_id, user_id, customer_id, sale_date, pointsUsed, total_money) values
(1, 1, 3, '2024-06-11', 10, 100000),
(2, 2, 1, '2024-06-12', 20, 200000),
(3, 3, 5, '2024-06-13', 30, 300000),
(4, 4, 7, '2024-06-14', 40, 400000),
(5, 5, 9, '2024-06-14', 50, 500000),
(6, 6, 2, '2024-06-15', 60, 600000),
(7, 7, 4, '2024-06-15', 70, 700000),
(8, 8, 6, '2024-06-15', 80, 800000),
(9, 9, 8, '2024-06-16', 90, 900000),
(10, 10, 10, '2024-06-17', 100, 1000000);

insert into bill_product (bill_id, product_id, unit_price, discount, into_money) values
(1, 1, 15000, 0, 15000),
(1, 2, 10000, 0, 10000),
(2, 3, 50000, 0, 50000),
(2, 4, 250000, 0, 250000),
(3, 5, 200000, 0, 200000),
(3, 6, 150000, 0, 150000),
(4, 7, 10000, 0, 10000),
(4, 8, 20000, 0, 20000),
(5, 9, 25000, 0, 25000),
(5, 10, 150000, 0, 150000);

insert into inventory (inventory_id, product_id, quantity) values
(1, 1, 100),
(2, 2, 200),
(3, 3, 300),
(4, 4, 400),
(5, 5, 500),
(6, 6, 600),
(7, 7, 700),
(8, 8, 800),
(9, 9, 900),
(10, 10, 1000);

insert into inventory_provider (provider_id, product_id, input_quantity, import_price, provider_date) values
(1, 1, 100, 15000, '2024-06-11'),
(2, 2, 200, 10000, '2024-06-11'),
(3, 3, 300, 50000, '2024-06-11'),
(4, 4, 400, 250000, '2024-06-11'),
(5, 5, 500, 200000, '2024-06-11'),
(6, 6, 600, 150000, '2024-06-11'),
(7, 7, 700, 10000, '2024-06-11'),
(8, 8, 800, 20000, '2024-06-11'),
(9, 9, 900, 25000, '2024-06-11'),
(10, 10, 1000, 150000, '2024-06-11');



