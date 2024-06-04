-- Tạo database
CREATE SCHEMA `qlsanpham` ;

use qlsanpham;

-- Tạo các bảng
create table categories (
	category_id int primary key,
	category_name varchar(50)
);

create table products (
	product_id int primary key,
	product_name varchar(50),
	category_id int,
	price double,
    foreign key (category_id) references categories(category_id)
);

create table customers (
	customer_id int primary key,
	customer_name varchar(50),
	email varchar(50)
);

create table orders (
	order_id int primary key,
	customer_id int,
	order_date date,
	foreign key (customer_id) references customers(customer_id)
);

create table orderDetails (
	order_detail_id int primary key,
	order_id int,
	product_id int,
    quantity int,
	foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

-- Thêm bản ghi vào các bảng
insert into categories (category_id, category_name)
values (1, 'Điện tử'),
(2, 'Thời trang'),
(3, 'Đồ gia dụng'),
(4, 'Sách'),
(5, 'Thể thao');

insert into products (product_id, product_name, category_id, price)
values (1, 'Điện thoại Samsung', 1, 15000000),
(2, 'Áo thun nam', 2, 250000),
(3, 'Máy giặt LG', 3, 7000000),
(4, 'Sách giáo khoa', 4, 50000),
(5, 'Giày chạy bộ', 5, 1200000),
(6, 'Sách thiếu nhi', 4, 40000);

insert into customers (customer_id, customer_name, email)
values (1, 'Nguyễn Văn Hoàng', 'vanhoang@gmail.com'),
(2, 'Trần Văn Hà', 'vanhab@gmail.com'),
(3, 'Lê Văn Luyện', 'vanluyen@gmail.com'),
(4, 'Phạm Thị Quỳnh', 'thiQuynh@gmail.com'),
(5, 'Hoàng Văn Dương', 'vanduong@gmail.com');

insert into orders (order_id, customer_id, order_date)
values (1, 1, '2024-06-01'),
(2, 2, '2024-06-02'),
(3, 3, '2024-06-03'),
(4, 4, '2024-06-04'),
(5, 5, '2024-06-05');

insert into orderDetails (order_detail_id, order_id, product_id, quantity)
values (1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 4, 5),
(5, 5, 5, 2);

-- 1 Lấy thông tin tất cả các sản phẩm đã được đặt trong một đơn đặt hàng cụ thể.
select products.product_id, products.product_name, products.price, orderdetails.quantity 
from qlsanpham.products
inner join qlsanpham.orderDetails on products.product_id = orderdetails.product_id
where orderdetails.order_id = 2;

-- 2 Tính tổng số tiền trong một đơn đặt hàng cụ thể.
select sum(products.price * orderdetails.quantity) as tongTien
from qlsanpham.products
inner join qlsanpham.orderdetails on products.product_id = orderdetails.product_id
where orderdetails.order_id = 2;

-- 3 Lấy danh sách các sản phẩm chưa có trong bất kỳ đơn đặt hàng nào.
select * from qlsanpham.products
left join qlsanpham.orderdetails on products.product_id = orderdetails.product_id
where orderdetails.product_id is null;

-- 4 Đếm số lượng sản phẩm trong mỗi danh mục.
select categories.category_name, count(products.product_id) as SLSanPham
from qlsanpham.categories
left join products on categories.category_id = products.category_id
group by categories.category_name;

-- 5 Tính tổng số lượng sản phẩm đã đặt bởi mỗi khách hàng.
select customers.customer_name, sum(orderdetails.quantity) as SLSanPham
from qlsanpham.customers
inner join qlsanpham.orders on customers.customer_id = orders.customer_id
inner join qlsanpham.orderdetails on orders.order_id = orderdetails.order_id
group by customers.customer_name;

-- 6 Lấy thông tin danh mục có nhiều sản phẩm nhất.
select categories.category_name, count(products.product_id) as SLSanPham
from qlsanpham.categories
left join qlsanpham.products on categories.category_id = products.category_id
group by categories.category_name
order by SLSanPham desc
limit 1;

-- 7 Tính tổng số sản phẩm đã được đặt cho mỗi danh mục.
select categories.category_name, sum(orderdetails.quantity) as SLSanPham
from qlsanpham.categories
inner join qlsanpham.products on categories.category_id = products.category_id
inner join qlsanpham.orderdetails on products.product_id = orderdetails.product_id
group by categories.category_name;

-- 8 Lấy thông tin về top 3 khách hàng có số lượng sản phẩm đặt hàng lớn nhất.
select customers.customer_name, sum(orderdetails.quantity) as SLSanPham
from qlsanpham.customers
inner join qlsanpham.orders on orders.customer_id = customers.customer_id
inner join qlsanpham.orderdetails on orders.order_id = orderdetails.order_id
group by customers.customer_name
order by SLSanPham desc
limit 3;

-- 9 Lấy thông tin về khách hàng đã đặt hàng nhiều hơn một lần trong khoảng thời gian cụ thể từ ngày A -> ngày B.
select customers.customer_name, customers.email, count(orders.order_id) as soLanDat
from qlsanpham.customers
inner join qlsanpham.orders on orders.customer_id = customers.customer_id
WHERE orders.order_date between '2024-06-01' and '2024-06-05'
group by customers.customer_id, customers.customer_name
HAVING soLanDat > 1;

-- 10 Lấy thông tin về các sản phẩm đã được đặt hàng nhiều lần nhất và số lượng đơn đặt hàng tương ứng.
select products.product_id, products.product_name, products.price, count(orderdetails.order_id) as soLanDat
from qlsanpham.products
inner join qlsanpham.orderdetails on products.product_id = orderdetails.product_id
group by products.product_id, products.product_name, products.price
order by soLanDat desc;
