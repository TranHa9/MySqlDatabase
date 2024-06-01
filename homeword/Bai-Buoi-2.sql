-- 1 Tạo một bảng mới có tên “Product” với các trường: “product_id” , “product_name” (varchar), “price” (double) và “quantity” (int).
create table product (
    product_id int primary key,
    product_name varchar(50),
    price double,
    quantity int
);

-- 2 Thêm 10 sản phẩm vào bảng “Product” với thông tin sản phẩm bất kỳ.
insert into Product (product_id, product_name, price, quantity) 
values (1, 'Product 1', 10000, 100),
(2,'Product 2', 20000, 200),
(3, 'Product 3', 30000, 150),
(4, 'Product 4', 40000, 80),
(5, 'Product 5', 50000, 120),
(6, 'Product 6', 60000, 300),
(7, 'Product 7', 70000, 90),
(8, 'Product 8', 80000, 60),
(9, 'Product 9', 90000, 110),
(10, 'Product 10', 10000, 50);

-- 3 Thêm một trường “description” (varchar) vào bảng “Product” sau khi đã tạo bảng.
alter table Product add column description varchar(255);

-- 4 Cập nhật giá (price) của sản phẩm có “product_id” là 1 thành 99.
update Product set price = 99 where product_id = 1;

-- 5 Tăng giá của sản phẩm có “product_id” là 2 lên 10%.
update Product set price = price * 1.1 WHERE product_id = 2;

SET SQL_SAFE_UPDATES = 0;
-- 6 Cập nhật tên của người có id là 10 thành “John Doe”.
update Person set fullname = 'John Doe' where id = 10;

-- 7 Đổi quốc gia của người có id là 3 thành “Canada”.
update Person set country = 'Canada' where id = 3;

-- 8 Sửa ngày sinh của người có id là 7 thành “1990-05-15” và quốc gia thành Việt Nam.
update Person set birthday = '1990-05-15', country = 'Vietnam' where id = 7;

-- 9 Tăng mức lương của người có id là 40 lên 10%.
update Person set salary = salary * 1.1 where id = 40;

-- 10 Giảm lương của những người nào có mức lương trên 6000 xuống 15%
update Person set salary = salary * 0.85 where salary > 6000;



