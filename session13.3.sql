-- Tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Tạo bảng books
CREATE TABLE books (
    bookId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    author VARCHAR(50) NOT NULL,
    publishedYear INT NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Tạo bảng readers
CREATE TABLE readers (
    readerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(11),
    CHECK (YEAR(birthDate) > 1900)
);

-- Tạo bảng borrows
CREATE TABLE borrows (
    borrowId INT AUTO_INCREMENT PRIMARY KEY,
    borrowDate DATE NOT NULL,
    returnDate DATE,
    bookId INT,
    readerId INT,
    FOREIGN KEY (bookId) REFERENCES books(bookId),
    FOREIGN KEY (readerId) REFERENCES readers(readerId),
    CHECK (borrowDate <= CURRENT_DATE)
);

-- Chèn dữ liệu tiếng Việt vào bảng books
INSERT INTO books (title, author, publishedYear, category) VALUES
('Ánh sáng cuối đường hầm', 'Nguyễn Nhật Ánh', 2005, 'Tiểu thuyết'),
('Bí mật của gió', 'Trần Văn Hùng', 2012, 'Truyện ngắn'),
('Bước chân lặng lẽ', 'Lê Minh Tuấn', 2018, 'Tâm lý'),
('Ai rồi cũng khác', 'Phạm Thu Hà', 2020, 'Tản văn'),
('Bầu trời tuổi thơ', 'Nguyễn Văn B', 2010, 'Thiếu nhi'),
('Anh là ai trong cuộc đời em', 'Hoàng Thị Lan', 2016, 'Ngôn tình'),
('Bí ẩn sau lớp màn', 'Đỗ Mạnh Cường', 2019, 'Trinh thám'),
('Ánh trăng không nói', 'Vũ Thị Hương', 2013, 'Lãng mạn'),
('Bắt đầu từ hôm nay', 'Ngô Thanh Vân', 2021, 'Phát triển bản thân'),
('Bức tranh cuộc sống', 'Trịnh Công Sơn', 2000, 'Nghệ thuật');

-- Cập nhật thông tin tác giả cho bookId = 1
UPDATE books
SET author = 'Nguyễn Văn A'
WHERE bookId = 1;

-- Truy vấn sách có tiêu đề bắt đầu bằng 'A' hoặc 'B'
SELECT *
FROM books
WHERE title LIKE 'A%' OR title LIKE 'B%';