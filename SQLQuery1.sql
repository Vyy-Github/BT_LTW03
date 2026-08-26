CREATE DATABASE LTWebDB;
GO
USE LTWebDB;
GO

CREATE TABLE Category (
    id INT IDENTITY(1,1) PRIMARY KEY,
    categoryname NVARCHAR(255) NOT NULL,
    images NVARCHAR(500),
    status INT DEFAULT 1
);
GO

-- Chèn dữ liệu mẫu
INSERT INTO Category (categoryname, images, status) VALUES 
(N'Điện thoại', 'phone.jpg', 1),
(N'Laptop', 'laptop.jpg', 1),
(N'Phụ kiện', 'accessory.jpg', 1);
GO