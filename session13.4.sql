-- Tạo cơ sở dữ liệu nếu chưa có
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Tạo bảng readers
CREATE TABLE IF NOT EXISTS readers (
    readerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(11),
    CHECK (YEAR(birthDate) > 1900)
);

-- Chèn 10 bản ghi vào bảng readers
INSERT INTO readers (name, birthDate, address, phoneNumber) VALUES
('Nguyễn Văn Nam', '1995-06-12', 'Hà Nội', '0912345678'),
('Trần Thị Mai', '1988-03-25', 'Đà Nẵng', '0987654321'),
('Lê Văn Hùng', '1992-11-05', 'TP. Hồ Chí Minh', '0901234567'),
('Phạm Thị Hương', '2000-01-01', 'Huế', '0934567890'),
('Hoàng Minh Tuấn', '1978-07-19', 'Cần Thơ', '0945678901'),
('Đỗ Thị Lan', '1999-09-09', 'Hải Phòng', '0956789012'),
('Ngô Thanh Vân', '1980-12-30', 'Bình Dương', '0967890123'),
('Vũ Đức Anh', '1990-04-15', 'Nghệ An', '0978901234'),
('Bùi Thị Hoa', '1976-08-08', 'Quảng Ninh', '0989012345'),
('Trịnh Công Sơn', '1965-05-05', 'TP. Hồ Chí Minh', '0990123456');

-- Cập nhật: nối thêm 'genZ' vào name của độc giả sinh từ 1990 đến 2000
UPDATE readers
SET name = CONCAT(name, ' genZ')
WHERE YEAR(birthDate) BETWEEN 1990 AND 2000 and reader_id is not null;

-- Truy vấn: lấy tất cả độc giả có năm sinh lớn hơn 1975
SELECT *
FROM readers
WHERE YEAR(birthDate) > 1975;